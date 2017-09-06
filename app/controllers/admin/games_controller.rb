class Admin::GamesController < Admin::BaseController
  before_action :set_game, only: [:edit, :update, :destroy, :show]

  def index
    @games = Game.all
  end

  def show
  end

  def new
    @game = Game.new
  end

  def create
    Game.create(game_params)
    redirect_to admin_games_path
  end

  def edit
  end

  def update
    @game.update(game_params)
    redirect_to admin_games_path
  end

  def destroy
    @game.destroy
    redirect_to admin_games_path
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name)
  end
end
