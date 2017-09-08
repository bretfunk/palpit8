class Channel
  attr_reader :name, :channel_id, :logo

  def initialize(channel_info)
    @channel_info = channel_info
    @name         = channel_info[:display_name]
    @channel_id   = channel_info[:name]
    @logo         = channel_info[:logo]
  end
end
