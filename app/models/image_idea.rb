class ImageIdea < ApplicationRecord
  belongs_to :image
  belongs_to :idea
  validates_presence_of :image_id
  validates_presence_of :idea_id
end
