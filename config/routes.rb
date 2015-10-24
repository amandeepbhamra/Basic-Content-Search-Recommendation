Rails.application.routes.draw do

  resources :subjects
  devise_for :users

  resources :users
  resources :resources do
    collection do
      post '/', action: 'index', as: 'index'
    end
  end
  resources :classrooms

  root 'users#index'
end
