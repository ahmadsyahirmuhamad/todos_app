class TodoApps::UserSessionsController < TodoApps::BaseController

  skip_before_action :authenticate!
  skip_before_action :current_user
  before_action :redirect_if_already_login
  before_action :already_registered, only: [:create]

  def new
    @user = User.new()
  end

  def create
    # if user = User.create(user_params)
    #   flash[:success] = "Register Success"
    #   user_login(user)
    #   redirect_to user_path(user)
    # else
    #   flash[:alert] = "Register Failed"
    #   redirect_to :back
    # end
  end

  def destroy
    binding.pry
    user_logout()
    redirect_to main_index_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def already_registered
    user = User.find_by(email: user_params[:email])
    if user.present?
      flash[:alert] = "You Already Have An Account With Us"
      redirect_to :back
    end
  end

end
