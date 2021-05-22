class Account < ApplicationRecord
    has_many :contacts
    has_many :opportunities
    has_many :connections
    has_many :tasks
    belongs_to :user
end