class StreamersController < ApplicationController

  def index
  end

  def show
    @streamer = Streamer.new("vmgryl3yotuzd472lqye7m96nwhtyn", params[:id])
  end

end
