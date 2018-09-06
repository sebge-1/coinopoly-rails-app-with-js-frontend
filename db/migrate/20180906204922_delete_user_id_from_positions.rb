class DeleteUserIdFromPositions < ActiveRecord::Migration[5.2]
  def change
    remove_column(:positions, :user_id)
  end
end
