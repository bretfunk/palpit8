 GAMES = ["PUBG", "League of Legends", "Starcraft 2", "Destiny 2", "Overwatch"]

 GAMES.each do |game|
   Chatroom.create(topic: game)
   Game.create(name: game)
 end

1000.times do
  User.create(name: Faker::Name.name,
                         username: Faker::Name.name,
                         uid: Faker::Code.imei,
                         provider: "twitch",
                         email: "fake@email.com",
                         token: Faker::Code.imei
                           )
end
