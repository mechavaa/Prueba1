class StaticPagesController < ApplicationController
  def home
  	 if current_user
  	# 	current_user.post_wall
  	 current_user.check_in
  	 end
  end
end
