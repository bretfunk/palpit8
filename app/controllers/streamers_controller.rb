class StreamersController < ApplicationController

  def index
  end

  def show
    @streamer = Streamer.compile(current_user.token, params[:id])
  end

end
