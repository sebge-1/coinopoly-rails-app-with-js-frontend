class DeleteCurrentValueFromPortfolios < ActiveRecord::Migration[5.2]
  def change
    remove_column(:portfolios, :current_value)
  end
end
