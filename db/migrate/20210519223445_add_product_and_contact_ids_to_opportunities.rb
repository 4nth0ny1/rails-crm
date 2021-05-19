class AddProductAndContactIdsToOpportunities < ActiveRecord::Migration[6.1]
  def change
    add_reference :opportunities, :product, null: false, foreign_key: true
    add_reference :opportunities, :contact, null: false, foreign_key: true
  end
end
