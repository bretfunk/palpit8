require 'rails_helper'

RSpec.describe Role, type: :model do
  context "validations" do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  end
  context "assocations" do
    it { should have_many(:user_roles) }
    it { should have_many(:users) }
  end
end
