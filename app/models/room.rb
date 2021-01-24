class Room < ApplicationRecord
  has_many :messages
  has_many :users
  has_many :tutors
end
