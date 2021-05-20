class Opportunity < ApplicationRecord
    belongs_to :account
    belongs_to :user
    belongs_to :contact
    belongs_to :product
    has_many :connections
end