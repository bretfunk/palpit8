class SearchPresenter
  attr_reader :search

  def initialize(query, controller)
    @search = evaluate(query, controller)
  end

  def evaluate(query, controller)
    if controller == "games"
      GameSearch.new(query)
    elsif controller == "streams"
      StreamSearch.new(query)
    elsif controller == "channels"
      ChannelSearch.new(query)
    end
  end
end
