class StreamSearch

  def initialize(query)
    @results = retrieve_results(query)
  end

  def retrieve_results(query)
    compile_results(TwitchService.search_streams(query))
  end

  def compile_results(raw_results)
    raw_results.map do |result|
      StreamResult.new(result)
    end
  end
end
