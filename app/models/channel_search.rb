class ChannelSearch

  def initialize(query)
    @results = retrieve_results(query)
  end

  def retrieve_results(query)
    compile_results(TwitchService.search_channels(query))
  end

  def compile_results(raw_results)
    raw_results.map do |result|
      ChannelResult.new(result)
    end
  end
end
