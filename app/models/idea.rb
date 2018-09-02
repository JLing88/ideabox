class Idea < ApplicationRecord
  belongs_to :category
  validates_presence_of :title, :body
end
