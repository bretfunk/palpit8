 require 'rails_helper'

 describe "Game Index" do
   it "Displays all games" do
     Chatroom.create(topic: "Destiny 2")
     Chatroom.create(topic: "Path of Exile")
     Chatroom.create(topic: "Dota 2")
     
     visit games_path

     expect(page).to have_content("Destiny 2")
     expect(page).to have_content("Path of Exile")
     expect(page).to have_content("Dota 2")
   end
 end
