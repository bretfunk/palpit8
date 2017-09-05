require 'rails_helper'

describe TwitchService do
  context "#user_profile_info" do
    it "retrieves a users profile info" do
      VCR.use_cassette("#user_profile_info") do
        
        user_info = TwitchService.new.current_users_profile_info(ENV['TOKEN'])

        expect(user_info.class).to eq(Hash)
        expect(user_info).to have_key(:name)
        expect(user_info).to have_key(:email)
        expect(user_info).to have_key(:bio)
      end
    end
  end

  context "#current_users_channel_info" do
    it "retrieves a users channel info" do
      VCR.use_cassette("#user_channel_info") do
        
        channel_info = TwitchService.new.current_users_channel_info(ENV['TOKEN'])

        expect(channel_info.class).to eq(Hash)
      end
    end
  end

  context "#user_channel_followers" do
    it "retrieves a users followers" do
      VCR.use_cassette("#user_channel_followers") do
        
        follower_info = TwitchService.new.users_channel_follows(ENV['TOKEN'], 'honorshard')

        expect(follower_info.class).to eq(Hash)
      end
    end
  end
end
