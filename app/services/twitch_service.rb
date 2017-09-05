class TwitchService
  def initialize
    @conn = Faraday.new("https://api.twitch.tv")
  end

  def self.current_users_profile_info(user_token)
    binding.pry
    new.current_users_profile_info
  end

  def self.users_channel_follows(user_token, username)
    new.users_channel_follows(username)
  end

  def self.user_follow_streamers_channel(user_token, username)
    new.user_follow_streamers_channel(username)
  end

  def self.user_unfollow_streamers_channel(user_token, username, channel_name)
    new.user_unfollow_streamers_channel(username, channel_name)
  end

  def self.current_users_channel_info(user_token)
    new.current_users_channel_info
  end

  def self.channel_info(user_token, channel_name)
    new.channel_info(channel_name)
  end

  def self.channel_followers(user_token, channel_name)
    new.channel_followers(channel_name)
  end

  def self.channel_subscribers(user_token, channel_name)
    new.channel_subscribers(channel_name)
  end

  def self.search_channels(user_token, query)
    new.search_channels(query)
  end

  def self.search_streams(user_token, query)
    new.search_channels(query)
  end

  def self.search_games(user_token, query)
    new.search_games(query)
  end

  def self.stream_for_channel(user_token, channel_name)
    new.stream_for_channel(channel_name)
  end

  def self.streams_for_game(user_token, game_name)
    new.streams_for_game(game_name)
  end

  def self.streams_summary_for_game(user_token, game_name)
    new.streams_for_game(game_name)
  end

  def self.current_users_followed_streams(user_token)
    new.current_users_followed_streams
  end

  #user info requests

  def current_users_profile_info(user_token)
    response = @conn.get do |req|
      req.url                      "/kraken/user"
      req.headers['Client-ID']     = ENV['TWITCH_CLIENT_ID']
      req.headers['Authorization'] = "OAuth #{user_token}"
    end
    user_info = JSON.parse(response.body, symbolize_names: true)
  end

  def current_users_channel_info(user_token)
    response = @conn.get do |req|
      req.url                      "/kraken/channel"
      req.headers['Client-ID']     = ENV['TWITCH_CLIENT_ID']
     req.headers['Authorization'] = "OAuth #{user_token}"
    end
    channel_info = JSON.parse(response.body, symbolize_names: true)
  end

  def users_channel_follows(user_token, username)
    response = @conn.get do |req|
      req.url                      "/kraken/users/#{username}/follows/channels"
      req.headers['Client-ID']     = ENV['TWITCH_CLIENT_ID']
      req.headers['Authorization'] = "OAuth #{user_token}"
    end
    follow_info = JSON.parse(response.body, symbolize_names: true)
  end

  def users_followed_streams(user_token)
    response = @conn.get do |req|
      req.url                      "/kraken/streams/followed"
      req.headers['Client-ID']     = ENV['TWITCH_CLIENT_ID']
      req.headers['Authorization'] = "OAuth #{user_token}"
    end
    followed_streams = JSON.parse(response.body, symbolize_names: true)
  end

  def user_follow_streamers_channel(user_token, username, channel_name)
    response = @conn.put do |req|
      req.url                      "/kraken/users/#{username}/follows/channels/#{channel_name}"
      req.headers['Client-ID']     = ENV['TWITCH_CLIENT_ID']
      req.headers['Authorization'] = "OAuth #{user_token}"
    end
    follow_success = JSON.parse(response.body, symbolize_names: true)
  end

  def user_unfollow_streamers_channel(user_token, username, channel_name)
    response = @conn.delete do |req|
      req.url                      "/kraken/users/#{username}/follows/channels/#{channel_name}"
      req.headers['Client-ID']     = ENV['TWITCH_CLIENT_ID']
      req.headers['Authorization'] = "OAuth #{user_token}"
    end
    follow_success = JSON.parse(response.body, symbolize_names: true)
  end

  #channel requests

  def channel_info(user_token, channel_name)
    response = @conn.get do |req|
      req.url                      "/kraken/channels/#{channel_name}"
      req.headers['Client-ID']     = ENV['TWITCH_CLIENT_ID']
      req.headers['Authorization'] = "OAuth #{user_token}"
    end
    channel_info = JSON.parse(response.body, symbolize_names: true)
  end

  def channel_followers(user_token, channel_name)
    response = @conn.get do |req|
      req.url                      "/kraken/channels/#{channel_name}/follows"
      req.headers['Client-ID']     = ENV['TWITCH_CLIENT_ID']
      req.headers['Authorization'] = "OAuth #{user_token}"
    end
    channels_follower_info = JSON.parse(response.body, symbolize_names: true)
  end

  def channel_subscribers(user_token, channel_name)
    response = @conn.get do |req|
      req.url                      "/kraken/channels/#{channel_name}/subscriptions"
      req.headers['Client-ID']     = ENV['TWITCH_CLIENT_ID']
      req.headers['Authorization'] = "OAuth #{user_token}"
    end
    channels_subscriber_info = JSON.parse(response.body, symbolize_names: true)
  end

  #search requests

  def search_channels(user_token, query)
    response = @conn.get do |req|
      req.url                      "/kraken/search/channels?query=#{query}"
      req.headers['Client-ID']     = ENV['TWITCH_CLIENT_ID']
      req.headers['Authorization'] = "OAuth #{user_token}"
    end
    search_results = JSON.parse(response.body, symbolize_names: true)
  end

  def search_streams(user_token, query)
    response = @conn.get do |req|
      req.url                      "/kraken/search/streams?query=#{query}"
      req.headers['Client-ID']     = ENV['TWITCH_CLIENT_ID']
      req.headers['Authorization'] = "OAuth #{user_token}"
    end
    search_results = JSON.parse(response.body, symbolize_names: true)
  end

  def search_games(user_token, query)
    response = @conn.get do |req|
      req.url                      "/kraken/search/games?query=#{query}"
      req.headers['Client-ID']     = ENV['TWITCH_CLIENT_ID']
      req.headers['Authorization'] = "OAuth #{user_token}"
    end
    search_results = JSON.parse(response.body, symbolize_names: true)
    binding.pry
  end

  #stream requests

  def stream_for_channel(user_token, channel_name)
    response = @conn.get do |req|
      req.url                      "/kraken/streams/#{channel_name}"
      req.headers['Client-ID']     = ENV['TWITCH_CLIENT_ID']
      req.headers['Authorization'] = "OAuth #{user_token}"
    end
    stream = JSON.parse(response.body, symbolize_names: true)
  end

  def streams_for_game(user_token, game_name)
    response = @conn.get do |req|
      req.url                      "/kraken/streams/?game=#{game_name}"
      req.headers['Client-ID']     = ENV['TWITCH_CLIENT_ID']
      req.headers['Authorization'] = "OAuth #{user_token}"
    end
    streams = JSON.parse(response.body, symbolize_names: true)
  end

  def streams_summary_for_game(user_token, game_name)
    response = @conn.get do |req|
      req.url                      "/kraken/streams/summary/?game=#{game_name}"
      req.headers['Client-ID']     = ENV['TWITCH_CLIENT_ID']
      req.headers['Authorization'] = "OAuth #{user_token}"
    end
    streams_summary = JSON.parse(repsonse.body, symbolize_names: true)
  end
end
