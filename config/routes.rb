Rails.application.routes.draw do
root 'welcome#index'
post '/' => 'users#create'
get '/auth/facebook/callback' => 'sessions#create'
end