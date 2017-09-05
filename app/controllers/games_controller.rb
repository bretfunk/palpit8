class GamesController < ApplicationController

  def index
    #@games = Game.all
    @chatrooms = Chatroom.all
  end

  def show
    #@game = Game.find_by(slug: params[:slug])
    @chatroom = Chatroom.find_by(slug: params[:slug])
    @message = Message.new
  end
end
