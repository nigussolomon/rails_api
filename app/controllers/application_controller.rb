class ApplicationController < ActionController::API
    def authenticate_user!
        if request.headers["Authorization"].present?
            token = request.headers["Authorization"]
            user_id = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]["user_id"]
            username = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]["username"]
            user = User.find_by(id: user_id, username:  username)
            if user
            else
                render json: {message: "Unauthorized Access",success: false, status: 400}
            end
        else
            render json: {message: "Unauthorized Access",success: false, status: 400}
        end
    end

    def logged_in_user
        token = request.headers["Authorization"]
        user_id = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]["user_id"]
        return user_id
    end
end
