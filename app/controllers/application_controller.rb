class ApplicationController < ActionController::Base

    def current_user 
        @current_user || User.find_by_id(session[:user_id])
        #limits calls to db by seeing if a current user is set, if not looks inside the sessions hash to find user_id and sets the currentuser. 
    end
end
