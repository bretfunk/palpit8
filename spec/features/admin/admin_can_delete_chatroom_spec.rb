require 'rails_helper'

feature "Admin can delete games(chatrooms)" do
  scenario "Admin can delete games(chatrooms)" do
    admin = create(:user)
    admin_role = create(:role, name: "admin")
    admin.roles << admin_role
    game1 = create(:chatroom, topic: "Vim Simulator")
    game2 = create(:chatroom, topic: "Atom Simulator")

    allow_any_instance_of(ApplicationController).to receive(:current_user)
    .and_return(admin)

    visit admin_chatrooms_path
    expect(page).to have_content(game1.topic)
    expect(page).to have_content(game2.topic)
    expect(page).to have_css(".chatroom", count: 2)


    first('.chatroom').click_link('Delete')
    expect(current_path).to eq(admin_chatrooms_path)
    expect(page).to have_css(".chatroom", count: 1)
    expect(page).to have_content(game2.topic)
    expect(page).to_not have_content(game1.topic)
  end
end
