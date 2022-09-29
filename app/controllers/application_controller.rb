class ApplicationController < ActionController::Base
    before_action :set_current_user
    def set_current_user
        if session[:user_id]
            Current.user =User.find_by(id: session[:user_id])
        end
    end
    def require_logged_in
        message="please login to continue"
redirect_to signin_path , notice:message if Current.user.nil?
    end
end
