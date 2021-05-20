class Account < ApplicationRecord
    has_many :contacts
    has_many :opportunities
    has_many :connections
    belongs_to :user
end