OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, '503254463032442', '9af35a855a3504b3d8cd7b205105dd58', :scope => "email,publish_stream"


end


