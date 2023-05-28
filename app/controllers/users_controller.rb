class UsersController < ApplicationController
		before_action :authenticate_user!, except: [:login, :create]

	def login
		user = User.find_by(username: user_params[:username])
		if user && user.authenticate(user_params[:password])
			token = JWT.encode({
			user_id: user.id,
						username: user.username,
						email: user.email,
						role: user.role
			}, Rails.application.secrets.secret_key_base)
			render json: {token: token, success: true, status: 200}
		else
			render json: {success: false, status: 400}
		end
	end

	def create
		@user = User.new(user_params)
		if @user.save
			render json: {data: @user, success: true, status: 200}
		else
			render json: {data: @user.errors, success: false, status: 400}
		end
	end

	def show
				token = request.headers["Authorization"]
				user_id = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]["user_id"]
				if user_id.to_s == params[:id]
					@user = User.find(params[:id])
					render json: {data: @user, success: true, status: 200}
				else
					render json: {message: "Unauthorized Access", success: false, status: 400}
				end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			render json: {data: @user, success: true, status: 200}
		else
			render json: {data: @user.errors, success: false, status: 400}
		end
	end

	def destroy
		@user = User.find(params[:id])
		if @user.destroy
			render json: {data: @user, success: true, status: 200}
		else
			render json: {data: @user.errors, success: false, status: 400}
		end
	end

	private
	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation, :role)
	end
end
