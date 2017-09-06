class Admin::BaseController < ApplicationController
  before_action :authentication

  def admin?
    if current_user.nil?
      not_found
    else
      current_user.roles.exists?(name: "admin")
    end
  end

  private

  def authentication
    redirect_to root_path unless admin?
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
