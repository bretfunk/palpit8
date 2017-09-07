require 'rails_helper'

describe WatsonService do
  context "tone info" do
    it "retrieves tone info" do

      tone_info = WatsonService.new.watson_tone('public/stub_log.txt')
      expect(tone_info.class).to eq(Hash)
    end
  end
end
