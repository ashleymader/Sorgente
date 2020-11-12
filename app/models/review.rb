class Review < ApplicationRecord
  belongs_to :user
  belongs_to :resource

  validates :title, presence: true
  validates :comment, presence: true
  validates :stars, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 6}
end
