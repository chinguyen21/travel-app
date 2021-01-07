class SessionsController < ApplicationController
    def welcome
        render :layout => "layout"
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:id] = @user.id
            redirect_to @user
        else
            flash[:errors] = "Email or password is incorrect."
            redirect_to login_path
        end
    end

    def destroy
        session.clear
        redirect_to login_path
    end
end
