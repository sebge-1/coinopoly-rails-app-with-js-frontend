class DeleteValueFromCoins < ActiveRecord::Migration[5.2]
  def change
    remove_column(:coins, :value)
  end
end
