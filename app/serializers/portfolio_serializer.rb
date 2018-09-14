class PortfolioSerializer < ActiveModel::Serializer
  attributes :id, :name, :public, :value
  belongs_to :user
  has_many :positions, serializer: PositionSerializer
end
