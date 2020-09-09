class FacebookController < ApplicationController
  
    def create # Facebook sign in, sign up and username registration
        if @user = User.find_by(fb_id: auth['uid']) # If User has previously signed up via Facebook
          session[:user_id] = @user.id
          redirect_to root_path
        else # If user has never signed up with Facebook
          @user = User.new(fb_id: auth['uid'])
          @fb_name = auth['info']['name']
          render "username"
        end
    end

    def username # post path to complete Facebook registration
      @user = User.new(user_params)
      @user.password = SecureRandom.hex
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path
      else
        flash[:error] = "Error! "+@user.errors.full_messages.join(', ')
        @fb_name = user_params[:fb_name]
      end
    end

    def dont_refresh
      flash[:error] = "Error! User refreshed page."
      redirect_to login_path
    end
  
    private
    def auth #Facebook authorization macro
      request.env['omniauth.auth']
    end
  
    def user_params # Params for setting up a Username after a Facebook login
      params.require(:user).permit(:username, :fb_id, :fb_name)
    end  
  end