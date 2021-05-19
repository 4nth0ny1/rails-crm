class AddUserIdToOpportunities < ActiveRecord::Migration[6.1]
  def change
    add_reference :opportunities, :user, null: false, foreign_key: true

  end
end
