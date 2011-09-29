Ng::Application.routes.draw do

  get "friend/index"
  get "friend/add_friend"
  get "friend/remove_friend"

  resources :posts

  get "frontend/index"
  get "frontend/search"
  get "frontend/search_results"

  devise_for :users

  root :to => "frontend#index"
  
  match "search_results" => "frontend#search_results"

end
