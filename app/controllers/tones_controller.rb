class TonesController < ApplicationController
  def create
    @data = WatsonService.new.watson_tone('log/twitch_chat.log')
    ActionCable.server.broadcast 'tones',
      tone_data: @data
    head :ok
  end
end
