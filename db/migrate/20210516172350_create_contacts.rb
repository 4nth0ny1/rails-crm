class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :first_name 
      t.string :last_name 
      t.string :phone 
      t.string :email 
      t.string :role
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
