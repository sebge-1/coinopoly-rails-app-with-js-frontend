class SessionsController < ApplicationController
  include UsersHelper

  def create
    @sign_in_user = User.find_by(name: params[:user][:name])

    if @sign_in_user && @sign_in_user.authenticate(params[:user][:password])
      session[:user_id] = @sign_in_user.id
      redirect_to user_path(@sign_in_user)
    else
      flash[:error] = "Invalid signin credentials. Try again."
      @sign_up_user = User.new
      @sign_in_user = User.create(user_params)
      render :welcome
    end
  end

  def create_from_facebook
    @called_omniauth = true
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
    end
    if @user
      session[:user_id] = @user.id
      render 'users/show'
    else
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  def auth
    request.env['omniauth.auth']
  end
end
