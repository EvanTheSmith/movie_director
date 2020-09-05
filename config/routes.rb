Rails.application.routes.draw do
root 'welcome#index'

# Local sign up routes
resources :users, only: [:new, :create]

# Facebook sign up routes
get '/auth/facebook/callback' => 'sessions#create' # Sign up from Facebook
post '/sessions' => 'sessions#create' # Submit username after Facebook sign up
end