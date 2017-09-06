class ToneChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'tones'
  end

  def create(data)
    Tone.create(mood: data)
  end
end
