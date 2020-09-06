class UsersController < ApplicationController
  def new # Local Sign Up Form
  end
    
  def create # Sign Up A New User Using Local Sign Up Page : Post Path
    if @fb = User.find_by(username: user_params[:username])
      if @fb.fb_id
       flash[:error] = "Error! Facebook login required for this user."
       redirect_to login_path
      end
    else

      @user = User.new(user_params)
      if @user.save
       session[:user_id] = @user.id
       redirect_to root_path
      else
       flash[:error] = "Error! "+@user.errors.full_messages.join(' + ')
       redirect_to signup_path
      end
    end
  end

  private 
  def user_params
  params.require(:user).permit(:username, :password)
  end  
end