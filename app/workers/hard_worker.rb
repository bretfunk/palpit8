class HardWorker
  include Sidekiq::Worker

  def perform(channel)
    chat_log = Twitch::Chat::Client.new(channel: channel, nickname: 'rocketappliances1705', password: ENV["OAUTH_CHAT"], output: 'log/twitch_chat.log')
    chat_log.run!
  end
end
