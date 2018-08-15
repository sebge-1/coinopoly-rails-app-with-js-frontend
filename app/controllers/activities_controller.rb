class ActivitiesController < ApplicationController
  include UsersHelper

  def index
    @activities = PublicActivity::Activity.order("created_at desc")
  end

  def follower_feed
    @activities = self.index.select {|activity| current_user.follower_ids.include?(activity.owner_id)}
    render 'users/follower_feed'
  end

end
