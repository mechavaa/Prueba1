class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

   def signed_in?
    !current_user.nil?
  end

  before_filter :check_url

#redirecting the herokuapp and www version of domain
	def check_url
 	 url = request.url
  	if url.include?('nfctag.herokuapp.com')
 	   redirect_to ('http://nfctag.herokuapp.com')
 		elsif url.include?('www.nfctag.herokuapp.com')
  	  redirect_to ('http://nfctag.herokuapp.com')        
 	 	end    
	end
end


