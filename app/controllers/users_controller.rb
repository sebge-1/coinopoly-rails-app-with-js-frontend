class UsersController < ApplicationController
  include UsersHelper

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :welcome
    end
  end


  def show
    @user = User.find(params[:id])
    if logged_in?
      render 'show'
    else
      redirect_to root_path
    end
  end

end
