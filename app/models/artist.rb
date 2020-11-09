class Artist < ApplicationRecord
has_many :glams, dependent: :destroy
has_many :users, through: :glams
scope :female_artists, -> { where(gender: "Female")}
scope :male_artists, -> { where(gender: "Male")}
accepts_nested_attributes_for :glams, reject_if: proc { |attributes| attributes['glam_squad'].blank? ||  attributes['makeup'].blank? ||  attributes['hair'].blank?  || attributes['wardrobe'].blank? }



end
 