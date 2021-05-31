class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :product
   
    validates :title, :description, presence: true

end