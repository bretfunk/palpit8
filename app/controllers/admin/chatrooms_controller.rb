class Admin::ChatroomsController < Admin::BaseController
  before_action :set_chatroom, only: [:edit, :update, :destroy, :show]

  def index
    @chatrooms = Chatroom.all
  end

  def show
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    Chatroom.create(chatroom_params)
    redirect_to admin_chatrooms_path
  end

  def edit
  end

  def update
    @chatroom.update(chatroom_params)
    redirect_to admin_chatrooms_path
  end

  def destroy
    @chatroom.destroy
    redirect_to admin_chatrooms_path
  end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:id])
  end

  def chatroom_params
    params.require(:chatroom).permit(:topic)
  end
end
