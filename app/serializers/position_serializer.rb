class PositionSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :portfolio_id, :value
  belongs_to :portfolio
  belongs_to :coin
end
