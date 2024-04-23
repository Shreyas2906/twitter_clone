# config/routes.rb
Rails.application.routes.draw do
  devise_for :users
  resources :tweets
  resources :users do
    member do
      post :follow
      delete :unfollow
    end
  end
  root to: 'tweets#index'
end
