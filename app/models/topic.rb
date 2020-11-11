class Topic < ApplicationRecord
    has_many :resources 
    validates :name, presence: true, uniqueness: true
end
