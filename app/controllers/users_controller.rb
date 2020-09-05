class UsersController < ApplicationController
  def new
  @user = User.new
  end
    
  def create # Sign Up A New User Using Local Sign Up Page
  @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:error] = "Error! "+@user.errors.full_messages.join(', ')
      redirect_to root_path
    end
  end

  private 
  def user_params
  params.require(:user).permit(:username, :password)
  end  
end