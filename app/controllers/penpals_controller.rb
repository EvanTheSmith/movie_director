class PenpalsController < ApplicationController
    before_action :must_be_logged_in

    def index
     @penpals = Penpal.all
    end

    def show
     @penpal = Penpal.find(params[:id])
     @letters = @penpal.letters.where(user: current_user)
    end
    
end