Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  resources :ideas
  resources :categories, only: [:index, :new, :create, :show]
  resources :users, only: [:new, :create, :show]
end
