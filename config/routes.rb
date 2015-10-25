Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:index, :show]
  resources :resources, only: [:index, :show] do
    collection do
      post '/', action: 'index', as: 'index'
    end
  end

  root 'users#index'
end
