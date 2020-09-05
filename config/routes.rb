Rails.application.routes.draw do
root 'welcome#index'
resources :users, only: [:new, :create]
get '/auth/facebook/callback' => 'sessions#create'
end