class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :date
      t.string :notes

      t.references :account, null: false, foreign_key: true
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end
