class CreateJoinTableOpportunityProduct < ActiveRecord::Migration[6.1]
  def change
    create_join_table :opportunities, :products do |t|
      t.index [:opportunity_id, :product_id]
      t.index [:product_id, :opportunity_id]
    end
  end
end
