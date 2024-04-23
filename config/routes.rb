# config/routes.rb
Rails.application.routes.draw do
  devise_for :users
  resources :tweets
  resources :users do
    get 'search', on: :collection
    member do
      post :follow
      delete :unfollow
    end
  end
  root to: 'tweets#index'
end