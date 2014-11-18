Rails.application.config.middleware.use OmniAuth::Builder do
  provider :vimeo, ENV["VIMEO_CLIENT_ID"], ENV["VIMEO_CLIENT_SECRET"]
end
