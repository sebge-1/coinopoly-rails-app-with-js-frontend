class PositionSerializer < ActiveModel::Serializer
  attributes :id, :quantity
  belongs_to :portfolio
  belongs_to :user
end
