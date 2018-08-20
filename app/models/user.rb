class User < ApplicationRecord
  has_many :portfolios, dependent: :destroy
  has_many :positions, through: :portfolios
  # allow user to follow other users
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
# allow user to be followed by other users
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  #Disable inbuilt BCrypt validations to avoid bugs with FB login
  has_secure_password validations: false
  # require password for form signups but disable for omniauth login flow
  validates_presence_of :password, :on => :create, :if => :password_required
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  # changes to true only through sessions#create_from_facebook
  @omniauth_called = false
  # helper_method to help with validates_presence_of macro
  def password_required
    true unless @omniauth_called
  end

  # Follows a user.
  def follow(other_user)
    self.following << other_user
  end

  # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

  def follower_ids
    following.map{|follower| follower.id}
  end

end
