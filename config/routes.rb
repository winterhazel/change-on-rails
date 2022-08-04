Rails.application.routes.draw do
  root "application#index"

  devise_for :users, controllers: {registrations: "users/registrations", sessions: "users/sessions"}
  get "/users/:id", to: "users#show"

  resources :petitions do
    resources :signatures
  end
  get "/petitions/:id/comments", to: "comments#index"
  get "/petitions/:id/declare_victory", to: "petitions#declare_victory"
  get "/petitions/:id/close_petition", to: "petitions#close_petition"

  get "*path" => redirect("/")
end
