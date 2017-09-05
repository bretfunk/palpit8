class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find_by(topic: params[:slug])
    @message = Message.new
  end
end
