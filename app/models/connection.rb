class Connection < ApplicationRecord
    belongs_to :user
    belongs_to :account
    belongs_to :contact, required: false
    belongs_to :opportunity, required: false



end