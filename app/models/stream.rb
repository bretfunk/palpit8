class Stream
  attr_reader :stream_name, :streamer_id, :streamer_name, :viewers, :preview

  def initialize(stream_name, streamer_id, streamer_name, viewers, preview)
    @stream_name    = stream_name
    @streamer_id    = streamer_id
    @streamer_name  = streamer_name
    @viewers        = viewers
    @preview        = preview
  end
end
