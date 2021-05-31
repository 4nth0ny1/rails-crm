class Reply < ApplicationRecord
    belongs_to :user
    belongs_to :comment
   
    validates :reply, presence: true

end