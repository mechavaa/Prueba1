class SessionsController < ApplicationController
	def create
		user = User.from_omniauth(env["omniauth.auth"])
		session[:user_id] = user.id 
		if session[:token] && session[:callback] == true
			session[:callback] = false
			redirect_to coupon_path(session[:token])
		else
			redirect_to root_path
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url
	end
end