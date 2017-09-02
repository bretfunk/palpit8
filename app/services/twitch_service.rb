class TwitchService
  def initialize
    @conn = Faraday.new("https://api.twitch.tv")
  end

  def current_users_profile
    url = "/kraken/user"
  end
end
