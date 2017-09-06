class GameStream
  attr_reader :game_name,
              :game_streams

  def initialize(user_token, game_name)
    @user_token = user_token
    @game_name = game_name
    @twitch_service = TwitchService.new
    @game_streams = []
    compile_streams
  end

  def compile_streams
    streams = @twitch_service.streams_for_game(user_token, game_name)[:streams]
    @game_streams = streams.map do |stream|
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
