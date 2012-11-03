OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, '431464540247434', '9b149b516c312e6989957786554e54a6', :scope => "email,publish_stream"


end


