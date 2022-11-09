class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token

    def authenticate_user
        if session[:user_id]
            @current_user = User.find(session[:user_id])
        else
            render json: {error: 'User not found'}, status: 403
        end
    end
end
