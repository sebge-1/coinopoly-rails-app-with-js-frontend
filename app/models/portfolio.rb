class Portfolio < ApplicationRecord
  include PublicActivity::Model
  include PortfoliosHelper

  tracked except: :destroy, owner: ->(controller, model) {controller && controller.current_user}

  belongs_to :user
  has_many :positions, dependent: :destroy

  validates :name, presence: true
  after_create :set_value

  require 'rufus-scheduler'
  scheduler = Rufus::Scheduler.new
  scheduler.every '300s' do
    Portfolio.all.each do |portfolio|
      portfolio.set_value
    end
  end

  def set_value
    sum = 0
    self.positions.each do |pos|
      if pos.valid?
        sum += pos.value
      end
    end
    self.update(value: sum)
  end

end
