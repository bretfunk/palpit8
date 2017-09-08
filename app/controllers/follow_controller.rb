class FollowController < ApplicationController

  def edit
    TwitchService.user_follow_streamers_channel(current_user.token, current_user.username, params[:id])
  end

end
