class PositionsController < ApplicationController
  include UsersHelper

  def create
    @portfolio = Portfolio.find_by(id: params[:portfolio_id])
    @position = @portfolio.positions.create(position_params)
    redirect_to user_portfolio_path(current_user, @portfolio)
  end

  private
  def position_params
    params.require(:position).permit(:coin_id, :portfolio_id, :user_id, :quantity)
  end
end
