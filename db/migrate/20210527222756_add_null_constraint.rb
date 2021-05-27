class AddNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null :accounts, :company_name, false
    change_column_null :accounts, :address, false
    change_column_null :accounts, :phone, false

    change_column_null :contacts, :phone, false
    change_column_null :contacts, :first_name, false
    change_column_null :contacts, :last_name, false
    change_column_null :contacts, :email, false

    change_column_null :products, :name, false
    change_column_null :products, :description, false
    change_column_null :products, :price, false

    change_column_null :tasks, :date, false
    change_column_null :tasks, :notes, false

    change_column_null :users, :email, false
    change_column_null :users, :first_name, false
    change_column_null :users, :last_name, false

  end
end
