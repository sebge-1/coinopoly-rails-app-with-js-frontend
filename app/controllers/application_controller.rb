class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }
  include PublicActivity::StoreController
  def welcome
    @sign_up_user = User.new
    @sign_in_user = User.new
    render 'welcome'
  end
end
