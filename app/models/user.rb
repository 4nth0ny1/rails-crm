class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, uniqueness: true
    validates :first_name, :last_name, presence: true

    has_many :accounts
    has_many :contacts 
    has_many :opportunities
    has_many :products
    has_many :connections
    has_many :tasks
    has_many :suggestions
    has_many :comments
    has_many :replies

    def name 
      "#{first_name} #{last_name}"
    end 
  
    scope :by_first_name, -> { order('lower(first_name)') }

   


    def self.from_omniauth(auth)

        # Creates a new user only if it doesn't exist
        #auth.info.email returns the email address as a string
        #we are taking the email that google sent my app and then fetching the user assoicated to that email. if it is found then we log in and if not then code creates the user for us. 
        where(email: auth.info.email).first_or_initialize do |user|

          user.profile_image = auth.info.image
          user.email = auth.info.email
          user.first_name = auth.info.first_name
          user.last_name = auth.info.last_name
          #creates a new email in the db if we didn't find one
          user.password = SecureRandom.hex
          #creates a random password
          user.google_token = auth.credentials.token
          #allows me to be logged in iwhtout being logged in again.
          user.google_refresh_token = auth.extra.id_token
          #allows me to continue to be signed in unless i log out
          
        end
    end
end