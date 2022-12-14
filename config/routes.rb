# frozen_string_literal: true

Rails.application.routes.draw do
  root 'application#index'
  get '/', to: 'application#index'
  post '/', to: 'application#index'

  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  get '/users/:id', to: 'users#show'
  post '/users/:id', to: 'users#show'

  resources :petitions do
    collection do
      post :index
    end
    resources :signatures
  end
  get '/petitions/:id/comments', to: 'comments#index'
  post '/petitions/:id/comments', to: 'comments#index'
  get '/petitions/:id/declare_victory', to: 'petitions#declare_victory'
  get '/petitions/:id/close_petition', to: 'petitions#close_petition'

  get '/search', to: 'search#index'
  post '/search', to: 'search#index'

  get '*path' => redirect('/'), constraints: ->(req) { req.path.exclude? 'rails/active_storage' }
end
