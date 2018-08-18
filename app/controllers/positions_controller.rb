class PositionsController < ApplicationController
  include UsersHelper

  def create
    @portfolio = Portfolio.find_by(id: params[:portfolio_id])
    @position = Position.new(position_params)
    if @position.save
      @portfolio.positions << @position
      redirect_to user_portfolio_path(current_user, @portfolio)
    else
      flash[:error] = 'Please enter a positive number.'
      @coins = Coin.all
      @user = User.find_by(id: params[:user_id])
      render 'portfolios/show'
    end
  end

  def edit
    @portfolio = Portfolio.find(params[:portfolio_id])
    @position = Position.find_by(params[:id])
    @coins = Coin.all
  end

  def update
    @portfolio = Portfolio.find(params[:portfolio_id])
    @position = Position.find_by(params[:id])
    @position.update(position_params)
    redirect_to user_portfolio_path(@portfolio.user, @portfolio)
  end

  def destroy
    @portfolio = Portfolio.find_by(id: params[:portfolio_id])
    @portfolio.positions.delete(Position.find(params[:id]))
    redirect_to user_portfolio_path(@portfolio.user, @portfolio)
  end

  private
  def position_params
    params.require(:position).permit(:coin_id, :portfolio_id, :user_id, :quantity)
  end
end
