Rails.application.routes.draw do
root 'welcome#index'

# Local Routes
get '/signup' => 'users#new_signup'                 # Local Sign Up Form
post '/signup' => 'users#create_signup'             # Local Signup Post Path
get '/login' => 'users#new_login'                   # Log In Form
post '/login' => 'users#create_login'               # Log In Post Path (NOTE: same route as Facebook login)
post '/logout' => 'users#destroy'                   # Log Out

# Facebook Routes
get '/auth/facebook/callback' => 'facebook#create'  # Sign in from Facebook
get '/fb_login' => 'facebook#redirect'              # Cannot refresh Facebook Username Selection page
post '/fb_login' => 'facebook#create'               # Setup username after Facebook sign in
end