OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, '369679243120241', '248b6335922adec91e28757806d467ca', scope: "email,publish_stream,publish_checkins"
end


