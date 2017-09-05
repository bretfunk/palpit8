class User < ApplicationRecord
  has_many :messages
  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :chatrooms, through: :messages
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates :name, presence: true
  validates :uid, presence: true
  validates :provider, presence: true
  validates :token, presence: true

  def self.find_or_create_by_auth(auth)
    user = User.find_or_create_by(provider: auth['provider'], uid: auth['uid'])
    user.email = auth['info']['email']
    user.name = auth['info']['name']
    user.username = auth['info']['nickname']
    user.token = auth['credentials']['token']

    user.save
    user
  end

  def admin?
    roles.exists?(name: "admin")
  end

  def registered_user?
    roles.exists?(name: "registered_user")
  end
end
