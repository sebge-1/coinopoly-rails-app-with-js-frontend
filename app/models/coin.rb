class Coin < ApplicationRecord
  has_many :positions

  validates :name, presence: true

  def slugify_name
    self.name.downcase.gsub(' ', '-')
  end

  def set_img_url
    doc = Nokogiri::HTML(open("https://coinmarketcap.com/currencies/#{self.slugify_name}", :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
    url = doc.css('body > div.container.main-section > div > div.col-lg-10.padding-top-1x > div.details-panel.flex-container.bottom-margin-2x > div.details-panel-item--header.flex-container > h1 > img').attr('src')
    self.img_url = url
  end

  def set_ticker
    doc = Nokogiri::HTML(open("https://coinmarketcap.com/currencies/#{self.slugify_name}", :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
    ticker = doc.css('body > div.container.main-section > div > div.col-lg-10.padding-top-1x > div.details-panel.flex-container.bottom-margin-2x > div.details-panel-item--header.flex-container > h1 > span').inner_text
    self.ticker = ticker
  end

  def value
    doc = Nokogiri::HTML(open("https://coinmarketcap.com/currencies/#{self.slugify_name}", :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
    value = doc.css('#quote_price > span.h2.text-semi-bold.details-panel-item--price__value').text
    return value.to_f
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
