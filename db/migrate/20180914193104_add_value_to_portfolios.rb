class AddValueToPortfolios < ActiveRecord::Migration[5.2]
  def change
    add_column :portfolios, :value, :float
  end
end
