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

before_filter :remove_www!

protected

def remove_www!
  if Rails.env.production? and request.host[0..3] == "www."
    redirect_to "#{request.protocol}#{request.host_with_port[4..-1]}#{request.fullpath}", :status => 301
  end
end

end


