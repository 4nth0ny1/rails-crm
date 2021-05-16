class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :company_name
      t.string :address
      t.string :phone
      t.references :user

      t.timestamps
    end
  end
end
