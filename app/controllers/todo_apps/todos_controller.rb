class TodoApps::TodosController < TodoApps::BaseController

  before_action :current_todo, except: [:new, :create]

  def new
    @todo = current_user.todos.new()
    @categories = Category.all
  end

  def create
    if current_user.todos.create(todo_params)
      flash[:success] = "todo success"
      redirect_to user_path(@user)
    else
      flash[:success] = "todo failed"
      redirect_to :back
    end
  end

  def show
  end

  def edit
  end

  def update
    if @todo.update(todo_params)
      flash[:success] = "update todo success"
      redirect_to user_path(@user)
    else
      flash[:success] = "update todo failed"
      redirect_to :back
    end
  end


  private

  def todo_params
    params.require(:todo).permit(:title, :description, :category_id, :status, :user_id)
  end

  def current_todo
    @todo = Todo.find(params[:id])
  end

end


