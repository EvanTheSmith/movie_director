class LettersController < ApplicationController
    def index
     @letters = Letter.all # this isn't done yet
    end

    def show
     @penpal = Penpal.find(params[:penpal_id])
     @letter = Letter.find(params[:id])
    end
end