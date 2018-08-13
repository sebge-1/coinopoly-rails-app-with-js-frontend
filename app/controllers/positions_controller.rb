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

  private
  def position_params
    params.require(:position).permit(:coin_id, :portfolio_id, :user_id, :quantity)
  end
end
