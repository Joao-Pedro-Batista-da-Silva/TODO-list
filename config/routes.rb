Rails.application.routes.draw do
  devise_for :users
  #resources :lists
  #get "up" => "rails/health#show", as: :rails_health_check
  root "lists#index"

  get "/lists", to: "lists#index"
  get "/lists/new", to: "lists#new" , as:"new_list"
  get "/lists/:id", to: "lists#show" , as: "list"
  get "/lists/:id/edit", to:"lists#edit" ,as:"edit_list"

  post "/lists", to: "lists#create"
  post "/lists", to: "items#create_item"

  patch "/lists/:id", to: "lists#update"

  delete "/lists/:id", to: "lists#destroy"
end
