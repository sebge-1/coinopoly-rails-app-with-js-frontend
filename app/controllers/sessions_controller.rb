class SessionsController < ApplicationController
  include UsersHelper
  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:login_error] = "Invalid signin credentials. Try again."
      @user = User.create(user_params)
      render :welcome
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
