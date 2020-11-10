class User < ApplicationRecord
    has_many :reviews 
    has_many :resources #they created 
    has_many :reviewed_resources, through: :reviews, source: :resource #reviews on OTHER peoples resources 
    #needed to use source to distinguish naming convention. Cannot have 2 has_many relationships with the same name
    
    validates :username, uniqueness: true,  presence: true
    validates :email, uniqueness: true, presence: true
    has_secure_password
end
