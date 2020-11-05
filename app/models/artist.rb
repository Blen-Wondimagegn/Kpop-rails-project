class Artist < ApplicationRecord
has_many :glams
has_many :users, through: :glams
scope :female_artists, -> { where(gender: female)}
scope :female_artists, -> { where(gender: male)}
validates :glam_squad, :makeup, :hair, :wardrobe, presence: true
end
 