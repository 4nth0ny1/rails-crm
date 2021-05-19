class Account < ApplicationRecord
    has_many :contacts
    has_many :opportunities
    belongs_to :user
end