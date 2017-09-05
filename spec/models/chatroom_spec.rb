require 'rails_helper'

RSpec.describe Chatroom, type: :model do
  context "validations" do
    it { should validate_presence_of(:topic) }
  end
  context "assocations" do
    it { should have_many(:messages) }
    it { should have_many(:users) }
  end
end
