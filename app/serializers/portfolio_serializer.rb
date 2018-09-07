class PortfolioSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id, :public
end
