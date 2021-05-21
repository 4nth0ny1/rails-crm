class Connection < ApplicationRecord
    belongs_to :user
    belongs_to :account
    belongs_to :contact, required: false
    belongs_to :opportunity, required: false

    scope :by_notes, -> { order(notes: :desc) }
    scope :by_first_name, -> { order(first_name: :desc) }
    


end