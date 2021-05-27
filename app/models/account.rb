class Account < ApplicationRecord
    has_many :contacts
    has_many :opportunities
    has_many :connections
    belongs_to :user
    has_many :tasks, through: :contacts
    
    validates :company_name, presence: true, length: {minimum: 2}
    validates :address, presence: true, length: {minimum: 2}
    validates :phone, presence: true, length: {minimum: 7}

    scope :weekly_accounts, -> { where(created_at: Time.current.beginning_of_week..Time.current) }

    scope :daily_accts, -> { where(created_at: Time.current.beginning_of_day..Time.current) }

end