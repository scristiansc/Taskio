class RemoveUserIdFromTasks < ActiveRecord::Migration[8.0]
  def change
    remove_reference :tasks, :user, null: false, foreign_key: true
  end
end
