Rails.application.routes.draw do
  root "petitions#index"

  resources :petitions do
    resources :comments
  end
end
