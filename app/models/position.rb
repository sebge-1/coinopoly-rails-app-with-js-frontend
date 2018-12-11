class Position < ApplicationRecord
  include PublicActivity::Model
  tracked except: :destroy, owner: ->(controller, model) {controller && controller.current_user}

  belongs_to :coin
  belongs_to :portfolio
  validates :quantity, presence: true, numericality: {greater_than: 0}
  after_create :set_value

  require 'rufus-scheduler'
  scheduler = Rufus::Scheduler.new
  scheduler.every '1800s' do
    Position.all.each do |position|
      position.set_value
    end
  end

  def set_value
    value = self.coin.value * self.quantity
    self.update(value: value)
  end

  def coin_name
    self.coin.name
  end

  def portfolio_name
    self.portfolio.name
  end

end
