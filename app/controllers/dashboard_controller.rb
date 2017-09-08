class DashboardController < ApplicationController

  def show
    @profile = ProfileDashboard.new(current_user.token)
  end

end
