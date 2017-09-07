class GamesController < ApplicationController

  def index
    @chatrooms = Chatroom.all
  end

  def show
    @game_streams = GameStream.new("vmgryl3yotuzd472lqye7m96nwhtyn", params[:slug])
    @chatroom = Chatroom.find_by(topic: params[:slug].parameterize)
    @message = Message.new
  end
end
