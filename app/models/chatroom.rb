class Chatroom < ApplicationRecord
  validates :topic, presence: true
  has_many :messages, dependent: :destroy # destroys all messages when chatroom is destroyed
  has_many :users, through: :messages
end
