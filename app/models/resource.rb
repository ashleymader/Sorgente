class Resource < ApplicationRecord
  belongs_to :user #the user who added the resource
  belongs_to :topic
  has_many :reviews 
  has_many :users, through: :reviews #users who reviewed the resource 

  # validates :site_name, presence: true
  validates :url, presence: true
  # validates :description, presence: true
  validate :not_dupe, on: :create

  #resource doesnt know about it's reviews so we need to join the tables. Since we want all resources and not just the ones reviewed, we use left joins. Grouping by ID enables us to group all Resources with the same ID together and then we can average the stars. 
  scope :highest_rated, -> {left_joins(:reviews).group(:id).order('avg(stars) desc')} #will use this in a dropdown filter? 
  scope :lowest_rated, -> {left_joins(:reviews).group(:id).order('avg(stars) asc')}

  scope :most_reviewed, -> {joins(:reviews).group(:id).order('count(resources.id)desc')}
#get '/user_albums/reviewed_albums', to: 'user_albums#reviewed_albums_index', as: 'reviewed_albums'


  def topic_attributes=(attributes)
    self.topic = Topic.find_or_create_by(attributes) if !attributes['name'].empty?
    self.topic
  end

  def not_dupe
    if Resource.find_by(url: url, topic_id: topic_id)
      errors.add(:url, 'has already been added to that topic.')
    end
  end

  def self.a_z 
    order(:site_name)
  end

  def site_name_and_topic 
    "#{site_name} -- #{topic.name}"
  end 

  def self.search(params)
    #sanitizing search query with ? and feeding in argument of params
    #LOWER is to ensuring casing matches
    #LIKE and interpolating % % looks for site_names or description that contain the params search query 
      where("LOWER(site_name) LIKE :term OR LOWER(description) LIKE :term", term: "%#{params}%")
  end

  def most_reviewed 
    
  end



end
