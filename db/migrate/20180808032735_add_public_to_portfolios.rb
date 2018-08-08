class AddPublicToPortfolios < ActiveRecord::Migration[5.2]
  def change
    add_column :portfolios, :public, :boolean, default: true
  end
end
