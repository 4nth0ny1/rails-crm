class Contact < ApplicationRecord
    belongs_to :account
    belongs_to :user
	has_many :opportunity_contacts
    has_many :account_contacts

end 