class Message < ApplicationRecord
  belongs_to :user
  belongs_to :tutor
  after_create_commit { MessageBroadcastJob.perform_later self }
end
