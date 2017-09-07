class GamesController < ApplicationController

  def index
    @chatrooms = Chatroom.all
  end

  def show
    @game_streams = GameStream.new(params[:id])
    @chatroom = Chatroom.find_by(topic: params[:id].parameterize)
    @message = Message.new
  end
end
