class Contact < ApplicationRecord
    belongs_to :account
	has_many :opportunity_contacts

end 