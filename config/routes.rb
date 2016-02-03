Rails.application.routes.draw do

  devise_for :users

  resources :tasks do
    collection do
      delete 'destroy_multiple'
    end
    member do
      get 'completed' => 'tasks#completed_task', as: :completed
    end
  end

  root 'tasks#index'

end
