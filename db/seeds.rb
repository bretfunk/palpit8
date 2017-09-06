 GAMES = [
          "Destiny 2"
          "Dota 2",
          "Hearthstone",
          "League of Legends",
          "Overwatch",
          "Path of Exile",
          "PLAYERUNKNOWN'S BATTLEGROUNDS",
          "Smite",
          "Starcraft 2",
          "World of Warcraft",
          ]

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
              token: Faker::Code.imei)
end
