class StaticPagesController < ApplicationController
  def home
    if current_user && session[:coupon_id]
    	redirect_to coupon_url(session[:coupon_id])
    end
  end
  def oops
  end
end
