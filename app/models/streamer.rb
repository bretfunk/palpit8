class Streamer
  attr_reader :stream_name,
              :channel_name,
              :name,
              :profile_pic,
              :banner_picture,
              :banner_color,
              :followers,
              :game_image,
              :game_name,
              :watching_now,
              :total_views

  def initialize(current_user_token, channel_name = "")
    @user_token     = current_user_token
    @twitch_service = TwitchService.new
    @channel_name   = channel_name
    @stream_name    = ""
    @name           = ""
    @profile_pic    = ""
    @banner_picture = ""
    @banner_color   = ""
    @followers      = ""
    @game_image     = ""
    @game_name      = ""
    @watching_now   = ""
    @total_views    = ""
    compile_stream_page
  end

  def self.compile(user)
    new(user).compile
  end

  def compile_stream_page
    response = @twitch_service.stream_for_channel(user_token, channel_name)
    @stream_name    = response[:stream][:channel][:status]
    @name           = response[:stream][:channel][:display_name]
    @profile_pic    = response[:stream][:channel][:logo]
    @banner_picture = response[:stream][:channel][:profile_banner]
    @banner_color   = response[:stream][:channel][:profile_banner_background_color]
    @followers      = response[:stream][:channel][:followers]
    # @game_image     = response[:stream][:channel][:]
    @game_name      = response[:stream][:game]
    @watching_now   = response[:stream][:viewers]
    @total_views    = response[:stream][:channel][:views]
  end

  private
    attr_reader :user_token
end
