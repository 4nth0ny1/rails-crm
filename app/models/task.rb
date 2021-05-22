class Task < ApplicationRecord
    belongs_to :account
    belongs_to :contact
end 