class GameStream
  attr_reader :game_name,
              :streams

  def initialize(game_name)
    @game_name = game_name
    @twitch_service = TwitchService.new
    @streams = []
    compile_streams
  end

  def compile_streams
    game_streams = @twitch_service.streams_for_game(game_name)[:streams]
    @streams = game_streams.map do |stream|
      create_stream(stream)
    end
  end

  def create_stream(stream)
    Stream.new(
      stream[:channel][:status],
      stream[:channel][:name],
      stream[:channel][:display_name],
      stream[:viewers],
      stream[:preview][:medium]
    )
  end

  private
    attr_reader :user_token
end
