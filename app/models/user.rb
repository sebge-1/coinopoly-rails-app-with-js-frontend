class User < ApplicationRecord
  validates_presence_of :password, :on => :create, :if => :password_required
  has_many :portfolios
  has_many :positions, through: :portfolios

  validates :name, presence: true
  validates :email, presence: true

  @called_omniauth = false

  def password_required
     return false if @called_omniauth == true
     (authentications.empty? || !password.blank?)
   end


end
