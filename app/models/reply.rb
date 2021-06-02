class Reply < ApplicationRecord
    belongs_to :user
    belongs_to :comment
    has_one :product, through: :comment
   
    validates :reply, presence: true

end