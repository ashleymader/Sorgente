class SessionsController < ApplicationController

    def index 

    end

    def destroy 
        session.delete(:user_id)
        redirect_to '/'
    end

    def new 
        #sanitize the password?? 
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user.try(:authenticate, params[:user][:password]) #works the same as @user && @user.authenticate(params[:user][:password])
            redirect_to user_path(@user)
        else  
            flash[:error] = "Please try again"
            redirect_to login_path
        end

    end
end
