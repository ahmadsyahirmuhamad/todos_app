class TodoApps::UsersController < TodoApps::BaseController


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
    params.require(:user).permit(:first_name, :last_name, :email)
  end

end
