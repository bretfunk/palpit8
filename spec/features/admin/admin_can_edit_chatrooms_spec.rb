require 'rails_helper'

feature "Admin can see games" do
  scenario "Admin can see all games (chatrooms)" do
    admin = create(:user)
    game1 = create(:chatroom, topic: "game1")

    allow_any_instance_of(ApplicationController).to receive(:current_user)
    .and_return(admin)

    visit admin_chatrooms_path
    expect(page).to have_content(game1.topic)
    expect(page).to_css("chatroom", count: 1)
    click_on("Edit")
    expect(current_path).to eq(edit_admin_chatroom_path)
    fill_in("chatroom_topic", with: "Candy Crush")
    click_on("Update Chatroom")
    expect(current_path).to eq(admin_chatrooms_path)
    expect(page).to have_content("Candy Crush")
  end
end
