class RemoveColumnsFromOpportunities < ActiveRecord::Migration[6.1]
  def change
    remove_column :opportunities, :products
    remove_column :opportunities, :contacts
    remove_reference :opportunities, :contact
  end
end
