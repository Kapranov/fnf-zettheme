class DashboardsController < ApplicationController
  layout 'dashboards', only: [:index]

  def index
    @users = User.all
    # @dashboards = current_user.dashboards
  end

  # private
  # def dashboard_params
  #   params.require(:dashboard).permit(:user_id)
  # end

end
