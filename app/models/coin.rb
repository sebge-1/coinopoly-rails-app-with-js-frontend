class Coin < ApplicationRecord
  require 'net/http'
  require 'json'

  has_many :positions, dependent: :destroy

  validates :name, presence: true
  after_create :set_img_url, :set_ticker, :set_value


  require 'rufus-scheduler'
  scheduler = Rufus::Scheduler.new
  scheduler.every '300s' do
    Coin.all.each do |coin|
      coin.set_value
    end
  end

  def slugify_name
    self.name.downcase.gsub(' ', '-')
  end

  def set_img_url
    doc = Nokogiri::HTML(open("https://coinmarketcap.com/currencies/#{self.slugify_name}", :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
    url = doc.css('body > div.container.main-section > div > div.col-lg-10.padding-top-1x > div.details-panel.flex-container.bottom-margin-2x > div.details-panel-item--header.flex-container > h1 > img').attr('src')
    self.update({img_url: url})
  end

  def set_ticker
    doc = Nokogiri::HTML(open("https://coinmarketcap.com/currencies/#{self.slugify_name}", :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
    ticker = doc.css('body > div.container.main-section > div > div.col-lg-10.padding-top-1x > div.details-panel.flex-container.bottom-margin-2x > div.details-panel-item--header.flex-container > h1 > span').inner_text
    self.update({ticker: ticker.delete('()')})
  end

  def set_value
    url = "https://min-api.cryptocompare.com/data/price?fsym=#{self.ticker}&tsyms=USD"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    price = JSON.parse(response)['USD']
    self.update({value: price})
  end

  def number_of_users
    count = 0
    User.all.each do |user|
      if user.positions.any?{|pos| pos.coin_id == self.id}
        count += 1
      end
    end
    return count
  end

  def self.with_most_holders
    self.all.max_by {|coin| coin.number_of_users}
  end

  def self.most_widely_held
    self.all.sort{|a,b| b.positions.count <=> a.positions.count}[0]
  end

end
