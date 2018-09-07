class ActivitiesController < ApplicationController
  include UsersHelper

  def index
    @activities = PublicActivity::Activity.order("created_at desc")
  end

  def follower_feed
    @activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user.follower_ids, owner_type: "User")
    render 'users/follower_feed'
  end

end
