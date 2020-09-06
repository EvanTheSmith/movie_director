class SessionsController < ApplicationController

  def new # Local Log In Form
  end

  def create # Local Log In Post Path
    @user = User.new(user_params)
    if @user.valid?
          @user = User.find_by(username: user_params[:username])
          if @user && @user.authenticate(user_params[:password])
           session[:user_id] = @user.id
           redirect_to root_path
          else
           flash[:error] = "Error! "+@user.errors.full_messages.join(' + ')
           redirect_to login_path
          end
    else
     flash[:error] = "Error! "+@user.errors.full_messages.join(' + ')
     redirect_to login_path
    end

    #if !@user
    #  @user = User.new
    #  @user.save
    #  flash[:error] = "Error! "+@user.errors.full_messages.join(' + ')
    #  redirect_to login_path
    #elsif @user.fb_id
    #  flash[:error] = "Error! Facebook login required for this user."
    #  redirect_to login_path # Refuse local login for users who registered via Facebook
    #else
    #  if !user_params[:password].blank? && @user.authenticate(user_params[:password])
    #    session[:user_id] = @user.id
    #    redirect_to root_path
    #  else
    #    flash[:error] = "Error! "+@user.errors.full_messages.join('+ ')
    #    redirect_to login_path
    #  end
    # end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end  
end