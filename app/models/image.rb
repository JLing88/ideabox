class Image < ApplicationRecord
  has_many :image_ideas
  has_many :ideas, through: :image_ideas
  validates_presence_of :url
end
