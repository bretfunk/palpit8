class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_by_auth(request.env['omniauth.auth'])
    if @user
      cookies.signed[:user_id] = @user.id
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      redirect_to root_path
    end
  end

  def destroy
    cookies.signed[:user_id] = nil
    session[:user_id] = nil
    redirect_to root_path
  end
end
