class Portfolio < ApplicationRecord
  include PublicActivity::Model
  tracked owner: ->(controller, model) {controller && controller.current_user}

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
