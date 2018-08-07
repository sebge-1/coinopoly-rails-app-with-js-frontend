class CreateCoins < ActiveRecord::Migration[5.2]
  def change
    create_table :coins do |t|
      t.string :name
      t.string :ticker
      t.integer :current_value

      t.timestamps
    end
  end
end
