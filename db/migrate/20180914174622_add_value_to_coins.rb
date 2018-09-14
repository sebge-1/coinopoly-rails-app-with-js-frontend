class AddValueToCoins < ActiveRecord::Migration[5.2]
  def change
    add_column :coins, :value, :float
  end
end
