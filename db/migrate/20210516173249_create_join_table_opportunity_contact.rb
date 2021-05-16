class CreateJoinTableOpportunityContact < ActiveRecord::Migration[6.1]
  def change
    create_join_table :opportunities, :contacts do |t|
      t.index [:opportunity_id, :contact_id]
      t.index [:contact_id, :opportunity_id]
    end
  end
end
