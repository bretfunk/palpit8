module ApplicationHelper
  def admin?
    current_user && current_user.admin?
  end

  def registered_user?
    current_user && current_user.registered_user?
  end
end
