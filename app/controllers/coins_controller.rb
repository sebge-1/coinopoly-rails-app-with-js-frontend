class CoinsController < ApplicationController

  def index
    @coins = Coin.all
  end

  def create
    @coin = Coin.new(coin_params)
    @coin.set_img_url
    if @coin.save
      redirect_to coin_path(@coin)
    else
      redirect_to 'admin'
    end
  end

  def show
    @coin = Coin.find(params[:id])
  end

  private
  def coin_params
    params.require(:coin).permit(:name, :ticker)
  end

end
