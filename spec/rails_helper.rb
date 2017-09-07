# This file is copied to spec/ when you run 'rails generate rspec:install'

require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'capybara/rails'

VCR.configure do |config|
  config.cassette_library_dir = "spec/cassettes"
  config.hook_into :webmock
  config.allow_http_connections_when_no_cassette = true
end

# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migration and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

def stub_twitch_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:twitch] = OmniAuth::AuthHash.new( {"provider"=>"twitch",
                                                                "uid"=>39350921,
                                                                "info"=>
  {"name"=>"Centronious",
   "email"=>"acentrelli@gmail.com",
   "nickname"=>"centronious",
   "description"=>nil,
   "image"=>"https://static-cdn.jtvnw.net/jtv_user_pictures/centronious-profile_image-3bfd079f54136dea-300x300.jpeg",
   "urls"=>{"Twitch"=>"http://www.twitch.tv/centronious"}},
  "credentials"=>{"token"=>ENV['TOKEN'], "expires"=>false},
  "extra"=>
  {"raw_info"=>
   {"display_name"=>"Centronious",
    "_id"=>39350921,
    "name"=>"centronious",
    "type"=>"user",
    "bio"=>nil,
    "created_at"=>"2013-01-15T02:42:40Z",
    "updated_at"=>"2017-09-03T20:02:15Z",
    "logo"=>"https://static-cdn.jtvnw.net/jtv_user_pictures/centronious-profile_image-3bfd079f54136dea-300x300.jpeg",
    "_links"=>{"self"=>"https://api.twitch.tv/kraken/users/centronious"},
    "email"=>"acentrelli@gmail.com",
    "partnered"=>false,
    "notifications"=>{"push"=>true, "email"=>true}}}})
end

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
RSpec.configure do |config|
  config.include(Shoulda::Callback::Matchers::ActiveModel)
end
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
