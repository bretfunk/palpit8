class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def show
    # @game = Game.find(params[:id])
    @game = TwitchService.current_users_profile_info(current_user.token)
  end
end
