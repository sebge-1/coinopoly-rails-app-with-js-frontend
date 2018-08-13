class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :positions

  validates :name, presence: true

  def value
    @sum = 0
    self.positions.each do |pos|
      @sum += pos.value
    end
    @sum
  end

end
