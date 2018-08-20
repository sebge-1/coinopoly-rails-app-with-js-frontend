class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  def welcome
    @sign_up_user = User.new
    @sign_in_user = User.new
    render 'welcome'
  end
end
