Rails.application.routes.draw do
  #get "up" => "rails/health#show", as: :rails_health_check
  root "lists#index"

  get "/lists", to: "lists#index"
  get "/lists/new", to: "lists#new", as:"new_topic"
  get "/lists/:id", to: "lists#show", as: "topic"
  post "/lists", to: "lists#create"
end
