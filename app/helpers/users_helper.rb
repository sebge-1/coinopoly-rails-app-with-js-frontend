module UsersHelper
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def public_portfolios?(user)
    user.portfolios.any?{|portfolio| portfolio.public}
  end

  def public_portfolio_number(user)
    user.portfolios.select{|portfolio| portfolio.public}.count
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :uid)
  end
end
