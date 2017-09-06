class Admin::BaseController < ApplicationController
  before_action :authentication

  def admin?
    current_user.roles.exists?(name: "admin")
  end

  private
  def authentication
    redirect_to root_path unless admin?
  end
end
