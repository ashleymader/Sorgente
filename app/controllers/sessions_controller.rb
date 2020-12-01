class SessionsController < ApplicationController

    skip_before_action :require_login
    
    def index 

    end

    def destroy 
        session.delete(:user_id)
        redirect_to root_path
    end

    def new 
        #sanitize the password?? 
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else  
            flash[:error] = "Please try again"
            redirect_to login_path
        end
    end

    def googleauth 
        #instantiating user to class method in user model. Sending in argument of auth so user model can see the omniauth hash
        @user = User.create_session_googleauth(auth)
        #setting session 
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def github 
        
        #instantiating user to class method in user model. Sending in argument of auth so user model can see the omniauth hash
        @user = User.create_session_gitauth(auth)
        #setting session 
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    private

    #looks at omniauth hash from provider
    def auth
        request.env['omniauth.auth']
    end

   
end
