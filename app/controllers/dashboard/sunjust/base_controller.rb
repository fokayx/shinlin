class Dashboard::Sunjust::BaseController < Dashboard::DashboardsController
  layout 'sl'

  before_action :authenticate_user!, except: [:sign_in]

  def sign_in

  end

end
