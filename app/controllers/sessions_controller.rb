class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:username])
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end  
end