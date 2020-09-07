Rails.application.routes.draw do
root 'welcome#index'

# Local sign up routes
get '/signup' => 'users#new_signup'                 # Local Sign Up Form
post '/signup' => 'users#create_signup'             # Local Signup Post Path

# Local log in routes
get '/login' => 'users#new_login'                   # Log In Form
post '/login' => 'users#create_login'               # Log In Post Path (NOTE: same route as Facebook login)

# Facebook log in routes
get '/auth/facebook/callback' => 'facebook#create'  # Sign in from Facebook
post '/fb_login' => 'facebook#create'               # Setup username after Facebook sign in
end