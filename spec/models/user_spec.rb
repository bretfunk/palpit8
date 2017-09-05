require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:uid) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:provider) }
  it { should validate_presence_of(:token) }
  end
  context "associations" do
    it { should have_many(:messages) }
    it { should have_many(:chatrooms) }
    it { should have_many(:user_roles) }
    it { should have_many(:roles) }
  end
end
