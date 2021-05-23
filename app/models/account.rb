class Account < ApplicationRecord
    has_many :contacts
    has_many :opportunities
    has_many :connections
    belongs_to :user
    has_many :tasks, through: :contacts

    scope :weekly_accounts, -> { where(created_at: Time.current.beginning_of_week..Time.current) }

end