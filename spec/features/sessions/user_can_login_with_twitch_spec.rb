require 'rails_helper'

describe "Twitch Login" do
  it "logs in a user with authentication" do

    visit '/'
    stub_twitch_omniauth

    expect(page.status_code).to eq(200)
    expect(current_path).to eq(root_path)
    click_link "Login with Twitch"
    expect(current_path).to eq(dashboard_path)
  end
end
