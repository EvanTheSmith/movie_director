class SessionsController < ApplicationController

  def new # Local Log In Form
  end

  def create # Local Log In Post Path
  user = User.find_by(username: user_params[:username])
   if user && user.authenticate(user_params[:password])
    session[:user_id] = user.id
    redirect_to root_path
   else
    new_user = User.new(user_params)
    new_user.valid?
    new_user.errors.delete(:username) if user # Clear "Username already taken" error message if user was found
    flash[:error] = "Error! "+new_user.errors.full_messages.join(' + ')
    redirect_to login_path
   end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end  
end