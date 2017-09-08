require 'rails_helper'

RSpec.feature 'User sends a chat message' do
  scenario 'unauthenticated user cant send message' do
    game = create(:game, name: "starcraft-2")
    create(:chatroom, topic: game.name.parameterize)

    visit("/games/#{game.slug}")

    expect(page).to have_content("Login to Chat")
  end
end
