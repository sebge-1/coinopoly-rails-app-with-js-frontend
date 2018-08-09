class CoinsController < ApplicationController

  def create
    @coin = Coin.create(coin_params)
  end

  private
  def coin_params
    params.require(:coin).permit(:name, :ticker)
  end

end
