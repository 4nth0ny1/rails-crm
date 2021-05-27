class Product < ApplicationRecord
    belongs_to :user
    has_many :connections

    validates :name, :description, :price, presence: true

end