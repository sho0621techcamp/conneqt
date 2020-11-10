class Tag < ApplicationRecord
  has_many :tag_users
  has_many :users, through: :tag_users
  has_many :tag_tutors
  has_many :tutors, through: :tag_tutors
end
