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

  has_secure_password validations: false

  validates :password, presence: true, on: :password_required
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  # changes to true only through sessions#create_from_facebook
  @called_omniauth = false

  # require password for form signups but disable for omniauth login flow
  def password_required
     return false if @called_omniauth == true
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
