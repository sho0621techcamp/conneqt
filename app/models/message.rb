class Message < ApplicationRecord
  belongs_to :user
  belongs_to :tutor
  belongs_to :room
  has_one_attached :image
  after_create_commit { MessageBroadcastJob.perform_later self }
  validates :content, presence: true
end
