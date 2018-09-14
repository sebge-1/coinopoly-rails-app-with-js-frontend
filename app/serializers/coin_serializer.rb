class CoinSerializer < ActiveModel::Serializer
  attributes :id, :name, :img_url, :ticker, :value
end
