class PenpalsController < ApplicationController
    before_action :must_be_logged_in

    def index
     @penpals = Penpal.all_alphabetically
    end

    def show
     flash[:error] = nil
     @penpal = Penpal.find(params[:id])
     @letters = @penpal.letters_from_me(current_user)
    end

    def new
     @penpal = Penpal.new
    end

    def create
    @penpal = Penpal.new(penpal_params)
    if @penpal.save
     redirect_to @penpal
    else
     flash_errors(@penpal)
     render :new
    end

    end

    private

    def penpal_params
    params.require(:penpal).permit(:first_name, :last_name, :age, :frequency, interest_ids:[])
    end
    
end