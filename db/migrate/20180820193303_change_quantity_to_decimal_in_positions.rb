class ChangeQuantityToDecimalInPositions < ActiveRecord::Migration[5.2]
  def change
     change_column :positions, :quantity, :decimal
  end
end
