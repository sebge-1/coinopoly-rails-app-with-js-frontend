class DeleteValueFromPositions < ActiveRecord::Migration[5.2]
  def change
    remove_column(:positions, :value)
  end
end
