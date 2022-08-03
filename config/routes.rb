Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}

  root "application#index"
  get "/petitions/:id/comments", to: "comments#index"

  resources :petitions do
    resources :signatures
  end

  get "*path" => redirect("/")
end
