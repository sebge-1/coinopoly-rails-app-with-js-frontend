class PortfolioSerializer < ActiveModel::Serializer
  attributes :id, :name, :public
  belongs_to :user
end
