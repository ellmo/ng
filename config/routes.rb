Ng::Application.routes.draw do

  get "wall/show"

  get "friend/index"
  get "friend/add_friend"
  get "friend/confirm_friend_request"
  get "friend/remove_friend"

  resources :posts
  resources :wall, :only => :show

  get "frontend/index"
  get "frontend/search"
  get "frontend/search_results"

  devise_for :users

  root :to => "frontend#index"
  
  match "search_results" => "frontend#search_results"

end
