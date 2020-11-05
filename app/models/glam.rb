class Glam < ApplicationRecord
  belongs_to :user
  belongs_to :artist
  validates :name, :gender, :height, :age, presence: true
end
