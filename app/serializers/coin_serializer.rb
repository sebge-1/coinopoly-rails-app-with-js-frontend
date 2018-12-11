class CoinSerializer < ActiveModel::Serializer
  attributes :id, :name, :img_url, :ticker, :value
  has_many :portfolios
end
