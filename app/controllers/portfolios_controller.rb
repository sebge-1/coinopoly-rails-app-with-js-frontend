class PortfoliosController < ApplicationController
  include UsersHelper

  def new
    @user = current_user
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = current_user.portfolios.build(portfolio_params)
    if @portfolio.save
      redirect_to user_portfolio_path(current_user, @portfolio)
    else
      redirect_to new_user_portfolio_path(current_user)
    end
  end

  def show
    @portfolio = Portfolio.find_by(params[:id])
    @position = Position.new
    @coins = Coin.all
  end

  private
  def portfolio_params
    params.require(:portfolio).permit(:name, :public, :user_id)
  end
end
