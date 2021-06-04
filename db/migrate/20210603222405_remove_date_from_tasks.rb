class RemoveDateFromTasks < ActiveRecord::Migration[6.1]
  def change
    remove_column :tasks, :date, :string
  end
end
