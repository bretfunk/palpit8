require 'rails_helper'

describe WatsonService do
  context "tone info" do
    it "retrieves tone info" do
      
      tone_info = WatsonService.new.read_chat
      expect(tone_info.class).to eq(Hash)
    end
  end
end
