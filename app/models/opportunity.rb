class Opportunity < ApplicationRecord
    belongs_to :account
    belongs_to :user
    belongs_to :contact
    belongs_to :product
    has_many :connections

    scope :weekly_opps, -> { where(created_at: Time.current.beginning_of_week..Time.current) }
end