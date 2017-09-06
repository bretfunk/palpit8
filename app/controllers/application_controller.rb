class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #before_action :authorize!

  add_flash_types :success,
                  :info,
                  :warning,
                  :danger

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_users_profile
    @current_user_profile ||= current_user.twitch_profile(current_user.token)
  end

  def current_permission
    @current_permission ||= Permission.new(current_user)
  end

  def authorize!
    redirect_to root_url unless authorized?
  end

  def authorized?
    current_permission.allow?(params[:controller], params[:action])
  end
end
