class HomeController < ApplicationController
  def index
    HardWorker.perform_async
  end

  def new
  end

  def refresh_part
    @data = WatsonService.new.watson_tone('log/twitch_chat.log')
    respond_to do |format|
      format.js
    end
  end
end
