Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitch, ENV["TWITCH_CLIENT_ID"], ENV["TWITCH_CLIENT_SECRET"], scope: 'channel_editor channel_feed_edit channel_feed_read chat_login user_follows_edit user_read user_subscriptions'
end
