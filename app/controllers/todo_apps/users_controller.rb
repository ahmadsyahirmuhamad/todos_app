class TodoApps::UsersController < TodoApps::BaseController
  skip_before_action :authenticate!, except: [:create]
  skip_before_action :current_user, except: [:create]
  # before_action :already_registered, only: [:create]

  def create
    binding.pry
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

end
