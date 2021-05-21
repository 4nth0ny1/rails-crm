class AddConnectionIdToContacts < ActiveRecord::Migration[6.1]
  def change
    add_reference :contacts, :connection, foreign_key: true
  end
end
