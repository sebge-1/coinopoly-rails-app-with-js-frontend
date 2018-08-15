class CoinsController < ApplicationController

  def index
    @coins = Coin.all
  end

  def create
    @coin = Coin.create(coin_params)
  end

  def show
    @coin = Coin.find(params[:id])
  end

  private
  def coin_params
    params.require(:coin).permit(:name, :ticker)
  end

end
