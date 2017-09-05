class Permission
  extend Forwardable

  attr_reader :user, :controller, :action

  def_delegators :user, :registered_user?,
                        :admin?

  def initialize(user)
    @user = user || User.new
  end

  def allow?(controller, action)
    @controller = controller
    @action     = action

    case
    when admin?
      admin_permissions
    when registered_user?
      registered_user_permissions
    else
      guest_user_permissions
    end
  end

  private

  def admin_permissions
    return true if controller == "sessions"
    return true if controller == "games" && action.in?(%w(index show))
  end

  def registered_user_permissions
    return true if controller == "sessions"
    return true if controller == "games" && action.in?(%w(index show))
  end

  def guest_user_permissions
    return true if controller == "sessions"
    return true if controller == "games" && action.in?(%w(index show))
  end
end
