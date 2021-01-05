class FavoritesController < ApplicationController
    before_action :not_logged_in

    def index
        if params[:user_id]
            if User.find_by(id: params[:user_id]).nil?
                redirect_to User.find(session[:id])
            else
                @favorites = User.find(session[:id]).favorites
            end
        else  
             @favorites = User.find(session[:id]).favorites
        end
    end
end
