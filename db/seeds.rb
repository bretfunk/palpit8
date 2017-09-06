GAMES = [
         "Destiny 2",
         "Dota 2",
         "League of Legends",
         "Overwatch",
         "Path of Exile",
         "PLAYERUNKNOWN'S BATTLEGROUNDS",
         "Starcraft 2",
         "World of Warcraft"
         ]
 
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
              token: Faker::Code.imei)
end
