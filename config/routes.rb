Rails.application.routes.draw do
root 'welcome#index'
get '/auth/facebook/callback' => 'sessions#create'
end