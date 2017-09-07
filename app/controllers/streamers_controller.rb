class StreamersController < ApplicationController

  def show
    HardWorker.perform_async(params[:id])
    @streamer = Streamer.new(params[:id])
  end
end
