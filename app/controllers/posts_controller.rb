class PostsController < ApplicationController

  def search_twitter_user
    # with search form, once screen_name is submitted, data will return in separate
    # search results view page.
    # regex? fuzzy search?
    query = params[:twitter_search]
    response = HTTParty.get(" https://api.twitter.com/1.1/users/show.json?screen_name=#{query}")
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
