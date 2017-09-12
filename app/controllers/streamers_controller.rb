class StreamersController < ApplicationController

  def show
    if Streamer.new(params[:id]).stream_name != ""
      # HardWorker.perform_async(params[:id])
      @streamer = Streamer.new(params[:id])
    else
      render :file => 'public/404.html'
    end
  end
end
