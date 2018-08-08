class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :positions

  validates :name, presence: true
end
