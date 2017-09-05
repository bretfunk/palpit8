class ToneChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'tones'
  end
end
