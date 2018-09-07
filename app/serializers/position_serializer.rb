class PositionSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :portfolio_id, :coin_id
end
