class RelationshipsController < ApplicationController
  include UsersHelper

  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    flash[:notice] = "You're now following #{user.name}"
    redirect_to users_path
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    flash[:notice] = "You've stopped following #{user.name}"
    redirect_to users_path
  end
end
