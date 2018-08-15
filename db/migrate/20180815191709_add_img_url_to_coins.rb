class AddImgUrlToCoins < ActiveRecord::Migration[5.2]
  def change
    add_column :coins, :img_url, :string
  end
end
