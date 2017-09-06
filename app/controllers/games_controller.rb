class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def show
    @game = Game.find_by(name: params[:id])
    @chatroom = Chatroom.find_by(topic: @game.name.parameterize)
    @message = Message.new
  end
end
