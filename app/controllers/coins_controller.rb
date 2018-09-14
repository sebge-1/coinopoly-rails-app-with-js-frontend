class CoinsController < ApplicationController

  def index
    @coins = Coin.all
  end

  def show
    @coin = Coin.find(params[:id])
  end

  private
  def coin_params
    params.require(:coin).permit(:name, :ticker, :img_url)
  end

end
