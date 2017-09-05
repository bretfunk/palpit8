require 'rails_helper'

RSpec.feature 'User visits a game page' do
  scenario 'and sees the previous messages' do
    user = User.create({"id"=>1,
                        "name"=>"MikelSage",
                        "username"=>"mikelsage",
                        "uid"=>"83965690",
                        "provider"=>"twitch",
                        "email"=>"michael.sagapolutele@yahoo.com",
                        "token"=>"123m23jwdnfsou4wkm22o3",
                        })
    game = create(:game)
    chatroom = create(:chatroom, topic: game.name.parameterize)
    chatroom.messages << create_list(:message, 3, chatroom: chatroom, user: user)

    allow_any_instance_of(ApplicationController).to receive(:current_user)
    .and_return(user)

    visit(game_path(game))

    expect(page).to have_content chatroom.messages.first.content
  end
end
