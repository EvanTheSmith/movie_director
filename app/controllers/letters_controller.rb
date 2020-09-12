class LettersController < ApplicationController
    before_action :confirm_user, only: [:show]
    before_action :must_be_logged_in

    def index
      if params.include?(:penpal_id)
       @letters = Letter.by_user(current_user).by_penpal(params[:penpal_id])
       @penpal = Penpal.find(params[:penpal_id])
      else
       @letters = Letter.by_user(current_user)
      end
    end

    def show
     @penpal = Penpal.find(params[:penpal_id])
     @letter = Letter.find(params[:id])
    end

    def new
     @letter = Letter.new
     @penpal = Penpal.find(params[:penpal_id])
    end

    def create
     @letter = Letter.new(letter_params)
     if @letter.save
      redirect_to penpal_letter_url(@letter.penpal, @letter)
     else
      flash_errors(@letter)
      @penpal = @letter.penpal
      render :new
     end
    end

    private

    def confirm_user
     return head(:forbidden) unless Letter.find(params[:id]).user == current_user
    end

    def letter_params
      params.require(:letter).permit(:title, :message, :user_id, :penpal_id)
    end
end