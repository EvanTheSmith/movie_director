Rails.application.routes.draw do
root 'welcome#index'

# Local Login/Signup Routes
get '/signup' => 'users#new_signup'                 # Local Sign Up Form
post '/signup' => 'users#create_signup'             # Local Signup Post Path
get '/login' => 'users#new_login'                   # Log In Form
post '/login' => 'users#create_login'               # Log In Post Path (NOTE: same route as Facebook login)
post '/logout' => 'users#destroy'                   # Log Out

# Facebook Login/Signup Routes
get '/auth/facebook/callback' => 'facebook#create'  # Sign in from Facebook
get '/fb_login' => 'facebook#dont_refresh'          # Cannot refresh Facebook Username Selection page
post '/fb_login' => 'facebook#username'             # Setup username after Facebook sign in

# Penpal and Letter Routes
# Nested
resources :penpals, only: [:index, :show, :new, :create] do
 resources :letters, only: [:index, :show, :new, :create]
end
# Not Nested
get '/letters' => 'letters#index'

end