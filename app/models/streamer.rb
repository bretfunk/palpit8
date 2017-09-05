class Streamer
  attr_reader :stream_name,
              :name,
              :profile_pic,
              :cover_picture,
              :followers,
              :subscribers,
              :game_image,
              :game_name,
              :watching_now,
              :total_views

  def initialize(current_user_token, channel_name)
    @user_token = current_user_token
    @twitch_service = TwitchService.new
    @channel_name = channel_name
  end

  def self.compile(user)
    new(user).compile
  end

  def compile
  end

  def stream_name
    @twitch_service.channel_info(user_token, channel_name)
  end

  def name
    @twitch_service
  end

  def profile_pic
  end

  def cover_picture
  end

  def followers
  end

  def subscribers
  end

  def game_image
  end

  def game_name
  end

  def watching_now
  end

  def total_views
  end

  private
    attr_reader :user_token, :channel_name
end
