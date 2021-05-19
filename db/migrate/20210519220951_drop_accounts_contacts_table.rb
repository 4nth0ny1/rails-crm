class DropAccountsContactsTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :accounts_contacts
  end
end
