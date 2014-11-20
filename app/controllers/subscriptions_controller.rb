class SubscriptionsController < ApplicationController

  #showing a user https://api.twitter.com/1.1/users/show.json?screen_name=crystaloptera
  #showing a user's tweets https://api.twitter.com/1.1/statuses/user_timeline.json?count=200&user_id=2788167642

  def create
    @subscription = Subscription.new(media: params[:media], user_id: session[:user_id], local_id: params[:local_id])
    @subscription.save
    redirect_to twitter_results_path(twitter_search: params[:twitter_search], twitter_page: params[:twitter_page])
  end

  def index
    @subscriptions = Subscription.where(user_id: session[:user_id])
    @client = set_twitter_client
  end

end
