class PortfolioSerializer < ActiveModel::Serializer
  attributes :id, :name, :public, :value
  belongs_to :user, serializer: UserSerializer
  has_many :positions, serializer: PositionSerializer
end
