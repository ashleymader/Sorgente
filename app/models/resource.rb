class Resource < ApplicationRecord
  belongs_to :user #the user who added the resource
  belongs_to :topic
  has_many :reviews 
  has_many :users, through: :reviews #users who reviewed the resource 
end
