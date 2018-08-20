class UsersController < ApplicationController
  include UsersHelper

  def index
    @users = User.all
  end

  def create
    @sign_up_user = User.new(user_params)
    if @sign_up_user.save
      session[:user_id] = @sign_up_user.id
      redirect_to user_path(@sign_up_user)
    else
      flash[:signup_error] = 'Something went wrong. Try again.'
      @sign_in_user = User.new
      render :welcome
    end
  end

  def show
    @user = User.find(params[:id])
    @portfolios = @user.portfolios
    if logged_in?
      render 'show'
    else
      redirect_to root_path
    end
  end

  def following
    @user = User.find_by(id: params[:id])
    @users = @user.following
  end

  def followers
    @user = User.find_by(id: params[:id])
    @users = @user.followers
  end

end
