Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:new, :create, :show, :index, :update, :edit]
      resources :challenges, only: [:new, :create, :show, :index, :destroy]
      resources :user_challenges, only: [:new, :create, :destroy]
      resources :friendships, only: [:new, :create, :destroy]
    end
  end

end
