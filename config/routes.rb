Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'todo_apps/main#index'

  scope module: 'todo_apps' do
    resources :main, only: [:index]
    resources :user_sessions, only: [:new, :create]
    resources :users, except: [:index, :create] do
      resources :todos
    end
  end

end