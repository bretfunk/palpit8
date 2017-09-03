Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitch, ENV["TWITCH_CLIENT_ID"], ENV["TWITCH_CLIENT_SECRET"], scope: 'channel_editor chat_login user_follows_edit user_read user_subscriptions channel_read channel_subscriptions'
end
