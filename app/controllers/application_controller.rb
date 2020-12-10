class ApplicationController < ActionController::Base
    include Pagy::Backend
    before_action :require_login
    
    helper_method :current_user, :logged_in?

    rescue_from CanCan::AccessDenied do |exception|
        flash[:error] = exception.message
        redirect_to user_path(current_user)
    end

    rescue_from ActiveRecord::RecordNotFound do |exception|
        flash[:error] = exception.message
        redirect_to user_path(current_user)
    end

    private 

    # tracks use across site 
    def current_user 
        @user ||= User.find_by_id(session[:user_id])
        #limits calls to db by seeing if a current user is set, if not looks inside the sessions hash to find user_id and sets the currentuser. 
    end

    #boolean for if user is logged in. Hard truthy or falsey value 
    def logged_in?
        !!current_user
    end

    #before action in app controller ensures they cannot view anything without logging in (unless displayed on main page or login/signup pages)
    def require_login
        redirect_to root_path if !logged_in?
    end

end
