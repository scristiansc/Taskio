class AddOwnerToTask < ActiveRecord::Migration[8.0]
  def change
    add_reference :tasks, :owner, null: false, foreign_key: { to_table: :user }, index: true
  end
end
