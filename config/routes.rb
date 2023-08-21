Rails.application.routes.draw do
  namespace :admins do
    get 'home/index'
  end
  # http://localhost:3000/users/sign_in
  devise_for :users,  path: 'users',
  controllers: {
      sessions:      'users/devise/sessions',
      passwords:     'users/devise/passwords',
      registrations: 'users/devise/registrations'
    }
# http://localhost:3000/admins/sign_in
devise_for :admins, path: 'admins',
    controllers: {
      sessions:      'admins/devise/sessions',
      passwords:     'admins/devise/passwords',
      registrations: 'admins/devise/registrations'
    }

  match '/users/:id',   to: 'users#show',   via: 'get'
  match '/users',   to: 'users#index',   via: 'get'

  resources :plans
  resources :training_sessions


  get 'home/index'

  resources :workouts
  resources :exercises
  resources :pauses
  resources :tempos
  resources :repetitions
  resources :lifts
  resources :workout_sets

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
