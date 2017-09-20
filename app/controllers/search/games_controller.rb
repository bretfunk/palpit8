class Search::GamesController < ApplicationController

  def index
    @search = SearchPresenter.new(params[:query])
  end

end
