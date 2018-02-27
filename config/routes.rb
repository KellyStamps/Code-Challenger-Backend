Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:new, :create, :show, :index, :update]
      resources :challenges, only: [:new, :create, :show, :index, :destroy, :update]
      resources :user_challenges, only: [:new, :create, :destroy]
      resources :friendships, only: [:new, :create, :destroy]
    end
  end

end
