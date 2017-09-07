class StreamersController < ApplicationController

  def show
    HardWorker.perform_async
    @streamer = Streamer.new(params[:id])
  end
end
