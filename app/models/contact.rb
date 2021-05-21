class Contact < ApplicationRecord
    belongs_to :account
    belongs_to :user
    belongs_to :connection
	has_many :opportunity_contacts
    has_many :account_contacts
    has_many :connections
end 