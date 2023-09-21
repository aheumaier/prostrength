Rails.application.routes.draw do
  namespace :admins do
    get 'home/index'
  end

  # http://localhost:3000/users/sign_in
  devise_for :users, path: 'users',
                     controllers: {
                       sessions: 'users/devise/sessions',
                       passwords: 'users/devise/passwords',
                       registrations: 'users/devise/registrations'
                     }

  # http://localhost:3000/admins/sign_in
  devise_for :admins, path: 'admins',
                      controllers: {
                        sessions: 'admins/devise/sessions',
                        passwords: 'admins/devise/passwords',
                        registrations: 'admins/devise/registrations'
                      }

  authenticated :user do
    root 'users/home#index', as: :auth_user_root
  end

  authenticated :admin do
    root 'admins/home#index', as: :auth_admin_root
  end

  namespace :admins do
    get 'home/index'
    # resource  :home_page,        only: [:index]
  end
  get '/admins', to: 'admins/home#index', as: :admins

  namespace :users do
    get 'home/index'
    # resource  :home_page,        only: [:index]
  end
  get '/users', to: 'users/home#index', as: :users

  match '/users/:id', to: 'users/home#show', via: 'get', as: :user
  # match '/users', to: 'users#index', via: 'get'

  resources :plans

  resources :training_sessions
  resources :workouts
  resources :exercises
  resources :workout_sets

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get 'home/index'
  root 'home#index'
end
