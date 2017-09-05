class Chatroom < ApplicationRecord
  validates :topic, presence: true
  validates :slug, uniqueness: true
  has_many :messages, dependent: :destroy # destroys all messages when chatroom is destroyed
  has_many :users, through: :messages
  before_validation :generate_slug

  def generate_slug
    self.slug = topic.parameterize
  end
end
