class Position < ApplicationRecord
  belongs_to :coin
  belongs_to :portfolio
  belongs_to :user

  def value
    self.coin.value * self.quantity
  end

  # validates :quantity, numericality: {greater_than: 0}
end
