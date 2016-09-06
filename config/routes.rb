Rails.application.routes.draw do
  root 'todo_apps/main#index'

  scope module: 'todo_apps' do
    resources :main, only: [:index]
  end

end
