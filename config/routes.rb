Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root "petitions#index"

  resources :petitions do
    resources :comments
  end
end
