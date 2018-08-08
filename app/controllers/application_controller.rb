class ApplicationController < ActionController::Base

  def welcome
    @user = User.new
    render 'welcome'
  end
end
