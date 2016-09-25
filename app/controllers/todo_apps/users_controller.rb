class TodoApps::UsersController < TodoApps::BaseController

  skip_before_action :authenticate!, only: [:create]
  skip_before_action :current_user, only: [:create]
  before_action :already_registered, only: [:create]

  def create
    if user = User.create(user_params)
      flash[:success] = "Register Success"
      user_login(user)
      redirect_to user_path(user)
    else
      flash[:alert] = "Register Failed"
      redirect_to :back
    end
  end

  def show
    @todos = @user.todos
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "User Update Success"
    else
      flash[:alert] = "User Update Failed"
    end
    redirect_to :back
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
