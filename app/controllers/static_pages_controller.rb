class StaticPagesController < ApplicationController
  def home
  	 if current_user
    # current_user.post_wall Coupon.where(:id=>session[:id]).first.message
  	 #current_user.check_in
  	 end
  end
  def oops
  end
end
