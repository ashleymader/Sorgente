class Resource < ApplicationRecord
  belongs_to :user #the user who added the resource
  belongs_to :topic
  has_many :reviews 
  has_many :users, through: :reviews #users who reviewed the resource 

  
  def topic_attributes=(attributes)
    self.topic = Topic.find_or_create_by(attributes) if !attributes['name'].empty?
    self.topic
  end


end
