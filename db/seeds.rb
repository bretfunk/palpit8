 GAMES = ["PUBG", "League of Legends", "Starcraft 2", "Destiny 2", "Overwatch"]
 ROLES = ["admin", "registered_user"]

 GAMES.each do |game|
   Chatroom.create(topic: game)
   Game.create(name: game)
 end

 ROLES.each do |role|
   Role.create(name: role)
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
