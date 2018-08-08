class Position < ApplicationRecord
  belongs_to :coin
  belongs_to :portfolio
  belongs_to :user

  validates :quantity, numericality: {greater_than: 0}
end
