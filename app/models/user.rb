class User < ApplicationRecord
  has_secure_password
  has_many :portfolios
  has_many :positions, through: :portfolios

  validates :name, presence: true
  validates :email, presence: true

  def largest_position
    self.positions.max_by do |position|
      position.value
    end
  end
end
