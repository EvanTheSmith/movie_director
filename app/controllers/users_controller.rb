class UsersController < ApplicationController
  def new # Local Sign Up Form
  end
    
  def create # Sign Up A New User Using Local Sign Up Page - Post Path
  @user = User.new(user_params)
  # @fb = User.find_by(username: user_params[:username])

    # if @fb && @fb.fb_id
    # flash[:error] = "Error! Facebook login required for this user."
    # redirect_to login_path
    # elsif @user.save
    if @user.save 
     session[:user_id] = @user.id
     redirect_to root_path
    else
     flash[:error] = "Error! "+@user.errors.full_messages.join(' + ')
     redirect_to signup_path
    end

  end

  private 
  def user_params
  params.require(:user).permit(:username, :password)
  end  
end