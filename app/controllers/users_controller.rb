class UsersController < ApplicationController
  def new
  end
    
  def create # Sign Up A New User Using Local Sign Up Page
  @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      if User.find_by(username: @user.username).fb_id
        flash[:error] = "Error! This username was used previously with a Facebook sign up."
        redirect_to new_user_path
      else
        flash[:error] = "Error! "+@user.errors.full_messages.join(', ')
        redirect_to new_user_path
      end
    end
  end

  private 
  def user_params
  params.require(:user).permit(:username, :password)
  end  
end