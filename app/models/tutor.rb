class Tutor < ApplicationRecord
  has_secure_password
  has_one_attached :image
  has_many :tag_tutors
  has_many :tags, through: :tag_tutors
  has_many :star_tutors
  has_many :messages
end
