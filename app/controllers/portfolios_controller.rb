class PortfoliosController < ApplicationController
  include UsersHelper

  def new
    @user = current_user
    @portfolio = Portfolio.new
  end

  def create
    @user = User.find_by(id: params[:user_id])
    @portfolio = @user.portfolios.build(portfolio_params)
    @portfolio.save
    if @portfolio.errors.any?
      render :new
    else
      redirect_to user_portfolio_path(@user, @portfolio)
    end
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @portfolio = Portfolio.find_by(id: params[:id])
    @position = Position.new
    @positions = @portfolio.positions
    @coins = Coin.all
  end

  def edit
    @user = User.find_by(id: params[:user_id])
    @portfolio = Portfolio.find(params[:id])
  end

  def update
    @user = User.find_by(id: params[:user_id])
    @portfolio = Portfolio.find(params[:id])
    @portfolio.update(portfolio_params)
    if @portfolio.errors.any?
      flash[:error] = "Something went wrong. Try again."
      render :new
    else
      redirect_to user_portfolio_path(@user, @portfolio)
    end
  end

  def destroy
    @user = User.find_by(id: params[:user_id])
    @user.portfolios.delete(Portfolio.find(params[:id]))
    redirect_to user_path(@user)
  end

  private
  def portfolio_params
    params.require(:portfolio).permit(:name, :public, :user_id)
  end
end
