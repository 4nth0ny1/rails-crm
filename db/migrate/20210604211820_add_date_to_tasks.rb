class AddDateToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :date, :datetime
  end
end
