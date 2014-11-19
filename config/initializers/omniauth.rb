Rails.application.config.middleware.use OmniAuth::Builder do
  provider :vimeo, ENV["VIMEO_CLIENT_ID"], ENV["VIMEO_CLIENT_SECRET"]
  provider :twitter, ENV["TWITTER_CLIENT_ID"], ENV["TWITTER_CLIENT_SECRET"]
end
