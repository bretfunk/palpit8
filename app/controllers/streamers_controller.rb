class StreamersController < ApplicationController

  def show
    HardWorker.perform_async
    @streamer = Streamer.new("vmgryl3yotuzd472lqye7m96nwhtyn", params[:id])
  end

end
