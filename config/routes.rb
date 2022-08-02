Rails.application.routes.draw do
  root "petitions#index"

  get "/petitions", to: "petitions#index"
  get "/petitions/:id", to: "petitions#show"
end
