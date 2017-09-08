class ProfileDashboard
  attr_reader :username, :user_id, :logo, :bio, :channels

  def initialize(user_token)
    @user_token = user_token
    @twitch_service = TwitchService.new
    @username = ""
    @user_id  = ""
    @logo     = ""
    @bio      = ""
    @channels = []
    compile_user_profile
  end

  def compile_user_profile
    establish_profile
    establish_channel_follows
  end

  def establish_profile
    response = @twitch_service.current_users_profile_info(user_token)
    @username = response[:display_name]
    @user_id  = response[:name]
    @logo     = response[:logo]
    @bio      = response[:bio]
  end

  def establish_channel_follows
    responses = @twitch_service.users_channel_follows(user_token, user_id)[:follows]
    @channels = responses.map do |follow|
      Channel.new(follow[:channel])
    end
  end

  private
    attr_reader :user_token
end
