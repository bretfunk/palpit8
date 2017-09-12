class TwitchService
  def initialize
    @conn = Faraday.new("https://api.twitch.tv")
  end

  def self.current_users_profile_info(user_token)
    new.current_users_profile_info(user_token)
  end

  def self.users_channel_follows(user_token, username)
    new.users_channel_follows(username)
  end

  def self.user_follow_streamers_channel(user_token, username, channel_name)
    new.user_follow_streamers_channel(user_token, username, channel_name)
  end

  def self.user_unfollow_streamers_channel(user_token, username, channel_name)
    new.user_unfollow_streamers_channel(username, channel_name)
  end

  def self.current_users_channel_info(user_token)
    new.current_users_channel_info(user_token)
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

  def self.search_channels(query)
    new.search_channels(query)
  end

  def self.search_streams(query)
    new.search_channels(query)
  end

  def self.search_games(query)
    new.search_games(query)
  end

  def self.stream_for_channel(channel_name)
    new.stream_for_channel(channel_name)
  end

  def self.streams_for_game(game_name)
    new.streams_for_game(game_name)
  end

  def self.streams_summary_for_game(game_name)
    new.streams_for_game(game_name)
  end

  def self.current_users_followed_streams(user_token)
    new.current_users_followed_streams
  end

  def dynamic_get_request(attrs)
    @conn.get do |req|
      req.url                        "/kraken/#{attrs[:url]}"
      req.headers['Client-ID']     = ENV['TWITCH_CLIENT_ID']
      req.headers['Authorization'] = header(attrs[:user_token])
    end
  end

  def header(user_token = nil)
    if user_token
      "OAuth #{user_token}"
    else
      ENV['TWITCH_CLIENT_SECRET']
    end
  end

  #user info requests

  def current_users_profile_info(user_token)
    response = dynamic_get_request({ :url => "user", :user_token => user_token })
    user_info = JSON.parse(response.body, symbolize_names: true)
  end

  def current_users_channel_info(user_token)
    response = dynamic_get_request({ :url => "channel", :user_token => user_token })
    channel_info = JSON.parse(response.body, symbolize_names: true)
  end

  def users_channel_follows(user_token, username)
    response = dynamic_get_request({ :url => "users/#{username}/follows/channels", :user_token => user_token })
    follow_info = JSON.parse(response.body, symbolize_names: true)
  end

  def users_followed_streams(user_token)
    response = dynamic_get_request({ :url => "streams/followed", :user_token => user_token })
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

  def stream_for_channel(channel_name)
    response = dynamic_get_request({ :url => "channels/#{channel_name}" })
    channel_info = JSON.parse(response.body, symbolize_names: true)
  end

  def channel_followers(user_token, channel_name)
    response = dynamic_get_request({ :url => "channels/#{channel_name}/follows", :user_token => user_token })
    channels_follower_info = JSON.parse(response.body, symbolize_names: true)
  end

  def channel_subscribers(user_token, channel_name)
    response = dynamic_get_request({ :url => "channels/#{channel_name}/subscriptions", :user_token => user_token })
    channels_subscriber_info = JSON.parse(response.body, symbolize_names: true)
  end

  #search requests

  def search_channels(query)
    response = dynamic_get_request({ :url => "search/channels?query=#{query}" })
    search_results = JSON.parse(response.body, symbolize_names: true)
  end

  def search_streams(query)
    response = dynamic_get_request({ :url => "search/streams?query=#{query}" })
    search_results = JSON.parse(response.body, symbolize_names: true)
  end

  def search_games(query)
    response = dynamic_get_request({ :url => "search/games?query=#{query}" })
    search_results = JSON.parse(response.body, symbolize_names: true)
  end

  #stream requests

  def stream_for_channel(channel_name)
    response = dynamic_get_request({ :url => "streams/#{channel_name}" })
    stream = JSON.parse(response.body, symbolize_names: true)
  end

  def streams_for_game(game_name, quantity = 4)
    response = dynamic_get_request({ :url => "streams/?game=#{game_name}&limit=#{quantity}&language=en" })
    streams = JSON.parse(response.body, symbolize_names: true)
  end

  def streams_summary_for_game(game_name)
    response = dynamic_get_request({ :url => "streams/summary/?game=#{game_name}" })
    streams_summary = JSON.parse(response.body, symbolize_names: true)
  end
end
