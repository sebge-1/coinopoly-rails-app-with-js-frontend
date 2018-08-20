class Portfolio < ApplicationRecord
  include PublicActivity::Model
  tracked except: :destroy, owner: ->(controller, model) {controller && controller.current_user}

  belongs_to :user
  has_many :positions, dependent: :destroy

  validates :name, presence: true

  def value
    @sum = 0
    self.positions.each do |pos|
      if pos.valid?
        @sum += pos.value
      end
    end
    @sum
  end

end
