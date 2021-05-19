class AddColumnsToConnections < ActiveRecord::Migration[6.1]
  def change
    add_reference :connections, :user, null: false, foreign_key: true
    add_reference :connections, :contact, foreign_key: true
    add_reference :connections, :product, foreign_key: true
    add_reference :connections, :opportunity, foreign_key: true
    add_reference :connections, :account, null: false, foreign_key: true
    add_column :connections, :notes, :text, null: false
    add_column :connections, :connection_type, :string, null: false
    add_column :connections, :opportunity_check, :boolean, null: false, default: false
  end
end
