class HomeController < ApplicationController
  def index
    HardWorker.perform_async
  end

  def new
    @data = WatsonService.new.watson_tone('log/twitch_chat.log')
  end

end
