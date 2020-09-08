class UsersController < ApplicationController
  before_action :cant_be_logged_in, except: :destroy

  def new_signup
    @user = User.new
  end

  def new_login
    @user = User.new
  end
    
  def create_signup # Local Signup Post Path
  @user = User.new(user_params)
    if @user.save 
    session[:user_id] = @user.id
    redirect_to root_path
    else
    flash[:error] = "Error! "+@user.errors.full_messages.join(' + ')
    render "new_signup"
    end
  end

  def create_login # Local Log In Post Path
    @user = User.find_by(username: user_params[:username])
     if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
     else
      @user = User.new(user_params)
      @user.valid?
      @user.errors.delete(:username) if User.find_by(username: user_params[:username])
      flash[:error] = "Error! "+@user.errors.full_messages.join(' + ')
      render "new_login"
     end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private 
  def user_params
  params.require(:user).permit(:username, :password)
  end  
end