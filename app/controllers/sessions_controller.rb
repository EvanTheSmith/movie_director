class SessionsController < ApplicationController
    def create
      if @user = User.find_by(username: auth['info']['name'])
        session[:user_id] = @user.id
        redirect_to root_path
      else
        @user = User.create(username: auth['info']['name'])
        redirect_to 
      end
    end

    private
    def auth
    request.env['omniauth.auth']
    end
end