class SearchController < ApplicationController

  def index
    @response = search_twitter_user
    @current_page = params[:twitter_page].to_i || 1
    @query = params[:twitter_search]
  end

  def search_twitter_user
    set_twitter_client
    twitter_page = params[:twitter_page].to_i
    @query = params[:twitter_search]
    set_twitter_client.user_search(@query, {page: twitter_page})
  end

  private

  def set_twitter_client
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CLIENT_ID"]
      config.consumer_secret     = ENV["TWITTER_CLIENT_SECRET"]
      config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
    end
  end
end
