class LangTag < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :tag

  
  has_many :users
  has_many :tutors
  has_many :messages
end
