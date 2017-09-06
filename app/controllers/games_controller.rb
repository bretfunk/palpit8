class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def show
    @streams = Streams.find(params[:id])
    @chatroom = Chatroom.find_by(topic: @game.name.parameterize)
    @message = Message.new
  end
end
