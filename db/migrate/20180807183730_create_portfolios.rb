class CreatePortfolios < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolios do |t|
      t.string :name
      t.integer :current_value
      t.string :user_id
      t.string :integer

      t.timestamps
    end
  end
end
