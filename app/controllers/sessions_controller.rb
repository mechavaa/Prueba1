class SessionsController < ApplicationController
	def create
		user = User.from_omniauth(env["omniauth.auth"])
		
		session[:user_id] = user.id 
		if session[:coupon_id]
			redirect_to coupon_path(session[:coupon_id])
		else
			redirect_to root_path
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url
	end
end