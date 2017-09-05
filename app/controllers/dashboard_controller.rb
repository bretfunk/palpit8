class DashboardController < ApplicationController
  def show
    @data = WatsonService.new.watson_tone('log/twitch_chat.log')
    unless @data[:code] == 400
      @data2 = @data[:document_tone][:tone_categories][0][:tones].sort_by { |t| t[:score] }.reverse!.first[:tone_name]
     ActionCable.server.broadcast 'tone',
        tone_data: @data2
    end
  end
end
