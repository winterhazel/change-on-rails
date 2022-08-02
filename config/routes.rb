Rails.application.routes.draw do
  root "petitions#index"

  get "/petitions", to: "petitions#index"
end
