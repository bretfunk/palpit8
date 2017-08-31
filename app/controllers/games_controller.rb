class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def show
    #this is currently the streams index
    @streams = Game.find_by(slug: params["slug"]).streams
  end

end
