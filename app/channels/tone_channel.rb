class ToneChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'tone'
  end
end
