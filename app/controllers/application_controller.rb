class ApplicationController < ActionController::Base

    before_action :require_login
    
    helper_method :current_user, :logged_in? 

    private 

    def current_user 
        @current_user || User.find_by_id(session[:user_id])
        #limits calls to db by seeing if a current user is set, if not looks inside the sessions hash to find user_id and sets the currentuser. 
    end

    def logged_in?
        !!current_user
    end

    def require_login
        redirect_to root_path if !logged_in?
    end
end
