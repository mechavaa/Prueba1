class StaticPagesController < ApplicationController
  def home
  	if current_user
  		current_user.post_wall
  	end
  end
end
