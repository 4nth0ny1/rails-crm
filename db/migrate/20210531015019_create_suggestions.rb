class CreateSuggestions < ActiveRecord::Migration[6.1]
  def change
    create_table :suggestions do |t|
      t.string :title, null: false
      t.string :description, null: false

      t.timestamps
    end
  end
end
