require 'rails_helper'

feature "Admin can see games" do
  scenario "Admin can see all games (chatrooms)" do
    admin = create(:user)
    game1 = create(:chatroom, topic: "game1")
    game2 = create(:chatroom, topic: "game2")

    allow_any_instance_of(ApplicationController).to receive(:current_user)
    .and_return(admin)

    visit admin_chatrooms_path
    expect(page).to have_content(game1.topic)
    expect(page).to have_content(game2.topic)
    expect(page).to have_css("chatroom", count: 2)
  end
end
