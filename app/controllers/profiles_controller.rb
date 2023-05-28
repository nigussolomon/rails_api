class ProfilesController < ApplicationController
		before_action :authenticate_user!

		def create
				@profile = Profile.new(profile_params)
				if @profile.save
						render json: {data: @profile, success: true, status: 200}
				else
						render json: {errors:  @profile.errors, success: false, status: 400}
				end
		end

		def show
				@profile = Profile.find_by(user_id: params[:id])
				if @profile
						render json: {data: @profile, success: true, status: 200}
				else
						render json: {errors:  @profile.errors, success: false, status: 400}
				end
		end

		def destroy
				@profile = Profile.find_by(user_id: params[:id])
				if @profile.destroy
						render json: {data: @profile, success: true, status: 200}
				else
						render json: {errors: @profile.errors, success: false, status: 400}
				end
		end


		def update
				@profile = Profile.find_by(user_id: params[:id])
				if @profile.update(profile_params)
						render json: {data: @profile, success: true, status: 200}
				else
						render json: {errors: @profile.errors, success: false, status: 400}
				end
		end

		private
		def profile_params
				params.require(:profile).permit(:first_name, :last_name, :phone_number, :age)
		end
		
end
