class CreateOpportunity < ActiveRecord::Migration[6.1]
  def change
    create_table :opportunities do |t|
      t.string :products
      t.string :contacts
      t.references :account, null: false, foreign_key: true
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
