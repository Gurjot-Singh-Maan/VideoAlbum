Rails.application.routes.draw do
  devise_for :users

  root "homes#index"

  resources :homes, only: :index
  resources :video_albums do
    resources :comments
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
end
