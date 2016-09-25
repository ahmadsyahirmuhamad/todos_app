class TodoApps::UserSessionsController < TodoApps::BaseController

  skip_before_action :authenticate!
  skip_before_action :current_user
  before_action :redirect_if_already_login, except: [:destroy]

  def create
    user = User.find_by(email: user_params[:email])
    if user && user.authenticate(user_params[:password])
      flash[:success] = "Login Success"
      user_login(user)
      redirect_to user_path(user)
    else
      flash[:alert] = "Login Failed"
      redirect_to :back
    end
  end

  def destroy
    user_logout()
    redirect_to main_index_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
