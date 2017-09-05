class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def show
    @game = Game.find_by(slug: params[:slug])
    #@chatroom = Chatroom.find_by(slug: @game.name.parameterize)
    @chatroom = Chatroom.find_by(slug: params[:slug])
    @message = Message.new
  end
end
