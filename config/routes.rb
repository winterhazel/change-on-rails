Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}

  root "application#index"
  get "/petitions/:id/comments", to: "comments#index"
  get "/users/:id", to: "users#show"
  get "/users/me", to: "users#show"

  resources :petitions do
    resources :signatures
  end

  get "*path" => redirect("/")
end
