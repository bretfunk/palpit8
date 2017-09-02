class DashboardController < ApplicationController
  def show
    @data = WatsonService.new.watson_tone('log/twitch_chat.log')
    render :show
    ActionCable.server.broadcast 'tones',
      tone_data: @data[:document_tone][:tone_categories][0][:tones]
    head :ok
  end
end
