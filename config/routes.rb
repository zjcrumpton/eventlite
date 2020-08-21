Rails.application.routes.draw do
  devise_for :users
  resources :events
  root to: "events#index"
  get '/users/:id/' => 'user#show', as: :user

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
