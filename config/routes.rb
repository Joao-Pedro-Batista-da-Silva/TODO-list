Rails.application.routes.draw do
  devise_for :users
  #resources :lists
  resources :items
  root "lists#index"

  get "/lists", to: "lists#index"
  get "/lists/new", to: "lists#new" , as:"new_list"
  get "/lists/:id", to: "lists#show" , as: "list"
  get "/item", to: "item#show"
  get "/lists/:id/edit", to:"lists#edit" ,as:"edit_list"


  get "/lists/:id/new_item", to: "item#new_item" 
  #get "/lists/:id/edit/new_item", to:"item#new_item" ,as:"edit_item"

  post "/lists", to: "lists#create"
  post "/item", to: "item#create"

  patch "/lists/:id", to: "lists#update"

  delete "/lists/:id", to: "lists#destroy"
  delete "/item/:id", to: "items#destroy"
end
