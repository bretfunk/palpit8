require 'rails_helper'

RSpec.describe Chatroom, type: :model do
  context "validations" do
    it "is valid with valid attributes" do
    chat = Chatroom.create(topic: "Turing")
    expect(chat.topic).to eq("Turing")
    expect(chat.slug).to eq("turing")
    end
  end
  context "assocations" do
    it { should have_many(:messages) }
    it { should have_many(:users) }
  end
end
