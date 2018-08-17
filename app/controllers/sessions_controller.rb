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
