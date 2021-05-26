class Task < ApplicationRecord
    belongs_to :user
    belongs_to :contact
    has_one :account, through: :contact

    validates :date, presence: true
    validates :notes, presence: true
end 