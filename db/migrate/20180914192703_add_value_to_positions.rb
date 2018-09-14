class AddValueToPositions < ActiveRecord::Migration[5.2]
  def change
    add_column :positions, :value, :float
  end
end
