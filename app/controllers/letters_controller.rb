class LettersController < ApplicationController
    before_action :confirm_user, only: [:show]
    before_action :must_be_logged_in

    def index
      if params.include?(:penpal_id)
      @letters = Letter.by_penpal(params[:penpal_id])
      else
      @letters = Letter.all
      end
    end

    def show
     @penpal = Penpal.find(params[:penpal_id])
     @letter = Letter.find(params[:id])
    end

    private

    def confirm_user
     return head(:forbidden) unless Letter.find(params[:id]).user == current_user
    end
end