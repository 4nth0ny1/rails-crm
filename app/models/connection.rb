class Connection < ApplicationRecord
    belongs_to :user
    belongs_to :account
    belongs_to :product, required: false
    belongs_to :contact, required: false
    belongs_to :opportunity, required: false
    validates: :connection_type, presence: true

    scope :by_date, -> { order(created_at: :desc) }
   
    scope :calls_today, -> { where(connection_type: "call", created_at: Time.current.beginning_of_day..Time.current) }

    scope :emails_today, -> { where(connection_type: "email", created_at: Time.current.beginning_of_day..Time.current) }


end