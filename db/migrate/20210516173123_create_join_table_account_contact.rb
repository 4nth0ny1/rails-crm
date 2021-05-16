class CreateJoinTableAccountContact < ActiveRecord::Migration[6.1]
  def change
    create_join_table :accounts, :contacts do |t|
      t.index [:account_id, :contact_id]
      t.index [:contact_id, :account_id]
    end
  end
end
