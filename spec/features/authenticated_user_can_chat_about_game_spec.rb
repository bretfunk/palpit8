require 'rails_helper'

RSpec.feature 'User sends a chat message' do
  scenario 'and sees their new message' do
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

    allow_any_instance_of(ApplicationController).to receive(:current_user)
    .and_return(user)

    visit(game_path(game))

    fill_in 'message[content]', with: 'Something'
    click_on 'Send'
  end
end
