class Review < ApplicationRecord
  belongs_to :user
  belongs_to :resource

  validates :title, presence: true
  validates :comment, presence: true
  validates :stars, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 6}

  validates :resource_id, uniqueness: { scope: :user_id, message: "has already been reviewed by you"  }


  def date_submitted 
    self.created_at.strftime("%D")
  end

end
