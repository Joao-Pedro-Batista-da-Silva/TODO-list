Rails.application.routes.draw do
  #get "up" => "rails/health#show", as: :rails_health_check
  root "lists#index"

  get "/lists", to: "lists#index"
  get "/lists/:id", to: "lists#show", as: "topic"
  get "/lists/new", to: "articles#new", as:"new_topic"
end
