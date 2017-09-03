require 'twitch/chat'

class TwitchChatService
  def initialize
    chat_log = Twitch::Chat::Client.new(channel: 'summit1g', nickname: 'rocketappliances1705', password: ENV["OAUTH_CHAT"], output: 'log/twitch_chat.log')
    chat_log.run!
  end
end
