class StaticPagesController < ApplicationController
  def home
  	if current_user
  		current_user.post_wall
  		current_user.page_like
  	end
  end
end
