class PositionsController < ApplicationController
  include UsersHelper

  def new
    @portfolio = Portfolio.find_by(id: params[:portfolio_id])
    @position = Position.new
    @coins = Coin.all
  end

  def create
    @portfolio = Portfolio.find_by(id: params[:portfolio_id])
    @position = @portfolio.positions.build(position_params)
    if @position.save
      @portfolio.positions << @position
      @portfolio.set_value
      render json: @position
    end
  end

  def edit
    @portfolio = Portfolio.find(params[:portfolio_id])
    @position = @portfolio.positions.find_by(id: params[:id])
    @coins = Coin.all
  end

  def update
    @portfolio = Portfolio.find(params[:portfolio_id])
    @position = @portfolio.positions.find_by(id: params[:id])
    @position.update(position_params)
    if @position.errors.any?
      flash.now[:error] = "Please enter a positive number."
      @coins = Coin.all
      render 'new'
    else
      redirect_to user_portfolio_path(@portfolio.user, @portfolio)
    end
  end

  def destroy
    @portfolio = Portfolio.find_by(id: params[:portfolio_id])
    @portfolio.positions.delete(Position.find(params[:id]))
    @portfolio.set_value
    redirect_to user_portfolio_path(@portfolio.user, @portfolio)
  end

  private
  def position_params
    params.require(:position).permit(:coin_id, :portfolio_id, :quantity)
  end
end
