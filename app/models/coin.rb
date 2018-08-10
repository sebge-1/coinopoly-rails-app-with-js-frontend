class Coin < ApplicationRecord
  has_many :positions

  validates :name, presence: true

  def value
    doc = Nokogiri::HTML(open("https://coinmarketcap.com/currencies/#{self.name.downcase}", :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
    value = doc.css('#quote_price > span.h2.text-semi-bold.details-panel-item--price__value').text
    return value.to_f
  end
end
