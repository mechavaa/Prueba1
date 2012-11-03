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

  def post_wall(message="Default")
  	facebook { |fb| fb.put_wall_post message }
  end

  def page_like(pagevalue="223676917704855")
    facebook { |fb| fb.put_like pagevalue }
  end

end
