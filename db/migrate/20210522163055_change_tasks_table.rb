class ChangeTasksTable < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :notes, :text
    remove_column :tasks, :account_id
  end
end
