Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Settings.oauth.facebook.app_id, Settings.oauth.facebook.app_secret, scope: 'email,public_profile', info_fields: 'first_name,last_name,email'
end
