class GamesController < ApplicationController

  def index
    @chatrooms = Chatroom.all
  end

  def show
    @game_streams = GameStream.new(params[:slug])
    @chatroom = Chatroom.find_by(slug: params[:slug].parameterize)
    @message = Message.new
  end
end
