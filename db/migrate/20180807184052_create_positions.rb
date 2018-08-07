class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|
      t.integer :user_id
      t.integer :portfolio_id
      t.integer :coin_id
      t.integer :quantity
      t.integer :value

      t.timestamps
    end
  end
end
