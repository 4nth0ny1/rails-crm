class Product < ApplicationRecord
    belongs_to :user
    has_many :connections

    validates :name, presence: true
    validates :description, presence: true
    validates :price, presence: true
end