class TodoApps::MainController < TodoApps::BaseController

  skip_before_action :authenticate!
  skip_before_action :current_user
  before_action :redirect_if_already_login
  before_action :already_registered, only: [:create]

  def index
    @user = User.new()
  end

end
