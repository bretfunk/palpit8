class TwitchService
  def initialize
    @conn = Faraday.new("https://api.twitch.tv")
  end

  def current_users_profile_info
    response = @conn.get do |req|
      req.url                      = "/kraken/user"
      req.headers['Client-ID']     = ENV['TWITCH_CLIENT_ID']
      req.headers['Authorization'] = "OAuth #{current_user.token}"
    end
    user_info = JSON.parse(response.body, symbolize_names: true)
  end
end
