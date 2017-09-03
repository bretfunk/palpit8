 GAMES = ["game1", "game2", "game3", "game4", "game5"]

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
