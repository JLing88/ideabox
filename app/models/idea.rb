class Idea < ApplicationRecord
  belongs_to :category
  has_many :image_ideas
  has_many :images, through: :image_ideas
  validates_presence_of :title, :body
end
