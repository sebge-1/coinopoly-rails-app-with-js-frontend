class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :positions

  validates :name, presence: true

  def value
    @sum = 0
    self.positions.each{|pos| @sum += pos.coin.value}
  end
end
