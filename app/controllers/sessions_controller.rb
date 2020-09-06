class SessionsController < ApplicationController

  def new # Local Log In Form
  end

  def create # Local Log In Post Path
    @user = User.new(user_params)
    if user_params[:username] && user_params[:password]
          @user_find = User.find_by(username: user_params[:username])
          if @user && @user.authenticate(user_params[:password])
           session[:user_id] = @user.id
           redirect_to root_path
          else
           @user.valid? if @user
           flash[:error] = "Error! "+@user.errors.full_messages.join(' + ')
           redirect_to login_path
          end
    else
     @user.valid?
     @user.errors.delete(:username) if User.find_by(username: @user.username)
     flash[:error] = "Error! "+@user.errors.full_messages.join(' + ')
     redirect_to login_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end  
end