module UsersHelper
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @user ||= User.find_by(id: session[:user_id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :admin, :uid)
  end
end
