class Account < ApplicationRecord
    has_many :contacts,  through: :account_contacts
    has_many :opportunities
    belongs_to :user

end