class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    protect_from_forgery with: :exception
    helper_method :current_user, :logged_in?

    private

    # Before Actions:

    def cant_be_logged_in
      redirect_to root_path if logged_in?
    end

    def must_be_logged_in
      return head(:forbidden) unless logged_in?
    end

    # Helper Methods:

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !current_user.nil?
    end

end
