class PostsController < ApplicationController

  def search
    # with search form, once screen_name is submitted, data will return in separate
    # search results view page.
    # regex? fuzzy search?
    HTTParty.get("https://api.twitter.com/1.1/users/search.json?q=#{user}").parsed_response
  end


  private

  def set_twitter_client
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CLIENT_ID"],
      config.consumer_secret     = ENV["TWITTER_CLIENT_SECRET"],
      config.access_token        = ENV["TWITTER_ACCESS_TOKEN"],
      config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
    end
  end
end
