class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  def welcome
    @user = User.new
    render 'welcome'
  end
end
