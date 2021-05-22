class Task < ApplicationRecord
    belongs_to :user
    belongs_to :contact
    has_one :account, through: :contact
end 