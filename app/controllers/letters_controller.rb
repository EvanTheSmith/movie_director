class LettersController < ApplicationController
    before_action :confirm_user, only: [:show]

    def index
     @letters = Letter.all # this isn't done yet
    end

    def show
     @penpal = Penpal.find(params[:penpal_id])
     @letter = Letter.find(params[:id])
    end

    private

    def confirm_user
     return head(:forbidden) unless current_user == Letter.find(params[:id]).user
    end
end