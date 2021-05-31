class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :product
    has_many :replies
   
    validates :title, :description, presence: true

end