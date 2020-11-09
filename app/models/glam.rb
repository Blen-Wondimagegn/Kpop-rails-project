class Glam < ApplicationRecord
  belongs_to :user
  belongs_to :artist
  # validates :name, :gender, :height, :age, presence: true
  # validates :glam_squad, :makeup, :hair, :wardrobe, presence: true
  
  def artist_name
    self.try(:artist).try(:name)
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end
end
