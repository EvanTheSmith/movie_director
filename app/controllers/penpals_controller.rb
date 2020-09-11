class PenpalsController < ApplicationController
    before_action :must_be_logged_in

    def index
     @penpals = Penpal.all
    end

    def show
     @penpal = Penpal.find(params[:id])
     @letters = @penpal.letters_from_me(current_user)
    end
    
end