class SessionsController < ApplicationController
    def welcome
        render :layout => "homepage"
    end
    
    def new
        @user = User.new
        render :layout => "filter_page"
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:id] = @user.id
            redirect_to user_welcome_path(@user)
        else
            flash[:errors] = "Email or password is incorrect."
            redirect_to login_path
        end
    end

    def destroy
        session.clear
        redirect_to "/"
    end
end


