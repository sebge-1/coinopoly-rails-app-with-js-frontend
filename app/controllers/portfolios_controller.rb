class PortfoliosController < ApplicationController

  def new
    @user = current_user
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    if @portfolio.save
      redirect_to portfolio_path(@portfolio)
    else
      redirect_to new_user_portfolio_path(current_user)
    end
  end
  
end
