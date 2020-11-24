class User < ApplicationRecord
    has_many :reviews 
    has_many :resources #they created 
    has_many :reviewed_resources, through: :reviews, source: :resource #reviews on OTHER peoples resources 
    #needed to use source to distinguish naming convention. Cannot have 2 has_many relationships with the same name
    
    validates :username, uniqueness: true,  presence: true
    validates :email, uniqueness: true, presence: true
    has_secure_password


    def self.create_session_googleauth(auth)
        #receiving the omni auth hash from sessions controller as an argument and then processing the email
        find_or_create_by(email: auth[:info][:email]) do |u|
            #setting username to email address without everything after the @
            u.username = u.email.split("@")[0]
            #creates a password that we never see. It's then salted and hashed via has_secure_password and then sent to the db. 
            u.password = SecureRandom.hex
        end
    end

    def self.create_session_gitauth(auth)
        #receiving the omni auth hash from sessions controller as an argument and then processing the email
        find_or_create_by(email: auth[:info][:email]) do |u|
            #setting username to email address without everything after the @
            u.username = auth[:info][:nickname]
            #creates a password that we never see. It's then salted and hashed via has_secure_password and then sent to the db. 
            u.password = SecureRandom.hex
        end
    end
end
