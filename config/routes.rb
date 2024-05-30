Rails.application.routes.draw do
  devise_for :users
  #resources :lists
  #get "up" => "rails/health#show", as: :rails_health_check
  root "lists#index"

  get "/lists", to: "lists#index"
  get "/lists/new", to: "lists#new" , as:"new_list"
  get "/lists/:id", to: "lists#show" , as: "list"
  get "/lists/:id/edit", to:"lists#edit" ,as:"edit_list"

  #get "/lists/new_item", to: "item#new_item" , as:"new_item"
  #get "/lists/:id/edit/new_item", to:"item#new_item" ,as:"edit_item"

  post "/lists", to: "lists#create"
  #post "/lists", to: "items#create_item"

  patch "/lists/:id", to: "lists#update"

  delete "/lists/:id", to: "lists#destroy"
end
