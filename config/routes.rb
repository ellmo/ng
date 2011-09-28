Ng::Application.routes.draw do
  get "frontend/index"

  devise_for :users

  root :to => "frontend#index"

end
