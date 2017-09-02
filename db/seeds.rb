 games = ["game1", "game2", "game3", "game4", "game5"]

 games.each do |game|
   Chatroom.create(topic: game)
 end

 games.each do |game|
   Game.create(name: game)
 end
