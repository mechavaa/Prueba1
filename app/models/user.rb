class User < ActiveRecord::Base
  attr_accessible :name, :oauth_expires_at, :oauth_token, :provider, :uid

  def self.from_omniauth(auth)
  	where(auth.slice(:provider, :uid)).first_or_initialize.tap  do |user|
  		user.provider = auth.provider
  		user.uid = auth.uid
  		user.name = auth.info.name
  		user.oauth_token = auth.credentials.token
  		user.oauth_expires_at = Time.at(auth.credentials.expires_at)
  		user.save!
  	end
  end

  def facebook
  	@facebook ||= Koala::Facebook::API.new(oauth_token)
 	  block_given? ? yield(@facebook) : @facebook
		rescue Koala::Facebook::APIError => e
  		logger.info e.to_s
  		nil # or consider a custom null object
	end

  def post_wall(message="Tweeting Test using NFC")
  	facebook { |fb| fb.put_wall_post message }
  end


  def checkin
  	facebook { |fb| fb.put_checkin(message: "Yo")}
  end

  #def page_like(pagevalue="156565477744131")
  #  facebook { |fb| fb.put_connections(pagevalue,"likes") }
  #end

  #def check_in
 
  #facebook { |fb| fb.put_connections("me","checkins", :place =>theplace)}
  #facebook { |fb| fb.put_connections('me',"checkins", :latitude =>"54.70063", :longitude=>"-1.59882", :name=>'PizzaGoGoSpenny', :id=> "317118648326356")}
  #end

end
