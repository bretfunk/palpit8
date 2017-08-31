class HomeController < ApplicationController
  def index
    HardWorker.perform_async
  end

  def new
    @mood_data = WatsonService.new.watson_tone
  end
end
