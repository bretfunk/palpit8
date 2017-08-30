require 'twitch/chat'

class TwitchChatService
  def initialize
    @chat_log = Twitch::Chat::Client.new(channel: 'shroud', nickname: 'rocketappliances1705', password: 'oauth:og4fk4d8p4iaj57p9nvu3rd4abdnu8', output: 'log/twitch_chat.log')
  end
end
