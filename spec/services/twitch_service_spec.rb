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
        expect(follower_info).to have_key(:follows)
        expect(follower_info).to have_key(:_links)
      end
    end
  end

  context "#users_followed_streams" do
    it "retrieves a users followed streams" do
      VCR.use_cassette("#users_followed_streams") do
        
        followed_info = TwitchService.new.users_followed_streams(ENV['TOKEN'])
        
        expect(followed_info.class).to eq(Hash)
        expect(followed_info).to have_key(:streams)
        expect(followed_info[:streams][0]).to have_key(:game)
        expect(followed_info[:streams][0]).to have_key(:viewers)
      end
    end
  end

  context "#users_follow_streamers_channel" do
    it "retrieves a users followers streams" do
      VCR.use_cassette("#users_follow_streamers_channel") do
        
        streams_info = TwitchService.new.user_follow_streamers_channel(ENV['TOKEN'], 'honorshard', 'lirik')

        expect(streams_info.class).to eq(Hash)
        expect(streams_info).to have_key(:created_at)
      end
    end
  end
  context "#channel_info" do
    it "retrieves the channel info" do
      VCR.use_cassette("#channel_info") do
        
        channel_info = TwitchService.new.channel_info(ENV['TOKEN'], 'lirik')

        expect(channel_info.class).to eq(Hash)
        expect(channel_info).to have_key(:name)
        expect(channel_info).to have_key(:game)
        expect(channel_info).to have_key(:status)
      end
    end
  end

  context "#channel_followers" do
    it "retrieves channel followers" do
      VCR.use_cassette("#channel_followers") do
        
        channel_followers = TwitchService.new.channel_followers(ENV['TOKEN'], 'lirik')

        expect(channel_followers.class).to eq(Hash)
        expect(channel_followers).to have_key(:_total)
      end
    end
  end

  #context "#channel_subscribers" do
    #it "retrieves a channels subscribers" do
      #VCR.use_cassette("#channel_subscribers") do
        
        #c_subscribers = TwitchService.new.channel_subscribers(ENV['TOKEN'], 'lirik')

        #expect(c_subscribers.class).to eq(Hash)
      #end
    #end
  #end

  context "#search_channels" do
    it "retrieves a search for channel" do
      VCR.use_cassette("#search_channels") do
        
        search = TwitchService.new.search_channels(ENV['TOKEN'], "lirik")

        expect(search.class).to eq(Hash)
        expect(search).to have_key(:_total)
        expect(search[:channels][0]).to have_key(:display_name)
      end
    end
  end

  context "#search_streams" do
    it "searchs streams" do
      VCR.use_cassette("#search_streams") do
        
        search2 = TwitchService.new.search_streams(ENV['TOKEN'], 'lirik')

        expect(search2.class).to eq(Hash)
        expect(search2).to have_key(:_total)
        expect(search2[:streams][0]).to have_key(:_id)
      end
    end
  end

  #context "#search_games" do
    #it "searches games" do
      #VCR.use_cassette("#search_games") do
        
        #games = TwitchService.new.search_games(ENV['TOKEN'], 'hearthstone')

        #expect(games.class).to eq(Hash)

      #end
    #end
  #end

  context "#stream_for_channel" do
    it "retrieves a stream by channel" do
      VCR.use_cassette("#stream_for_channel") do
        
        stream = TwitchService.new.stream_for_channel(ENV['TOKEN'], 'lirik')

        expect(stream.class).to eq(Hash)
        expect(stream[:stream]).to have_key(:_id)
        expect(stream[:stream][:_id]).to eq(26187477776)
        expect(stream[:stream]).to have_key(:viewers)
      end
    end
  end

  context "#streams_for_game" do
    it "retrieves stream for specific game" do
      VCR.use_cassette("#streams_summary_for_game") do
        
        stream2 = TwitchService.new.streams_for_game(ENV['TOKEN'], 'hearthstone')

        expect(stream2.class).to eq(Hash)
        expect(stream2).to have_key(:_total)
        expect(stream2[:streams][0]).to have_key(:_id)
        expect(stream2[:streams][0]).to have_key(:game)
      end
    end
  end

  context "#streams_for_game" do
    it "retrieves summary for game" do
      VCR.use_cassette("#streams_for_game") do
        
        stream3 = TwitchService.new.streams_summary_for_game(ENV['TOKEN'], 'hearthstone')

        expect(stream3.class).to eq(Hash)
        expect(stream3).to have_key(:channels)
        expect(stream3).to have_key(:viewers)
      end
    end
  end
end
