class TodoApps::BaseController < ApplicationController
  layout "todo_app"

  before_action :authenticate!
  before_action :current_user

  private

  def authenticate!
    unless current_user
      redirect_to new_user_session_path
      flash[:alert] = "You need to login before performing this action"
    end
  end

  def current_user
    @user = User.find_by(id: session[:user_id])
  end

  def user_login(user)
    session[:user_id] = user.id
  end

  def redirect_if_already_login
    if current_user
      flash[:success] = "You Already Login"
      redirect_to user_path(current_user)
    end
  end

end
