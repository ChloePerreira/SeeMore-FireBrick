class SubscriptionsController < ApplicationController

  #showing a user https://api.twitter.com/1.1/users/show.json?screen_name=crystaloptera
  #showing a user's tweets https://api.twitter.com/1.1/statuses/user_timeline.json?count=200&user_id=2788167642

  def create
    @subscription = Subscription.new(media: params[:media], user_id: session[:user_id], local_id: params[:local_id])
    @subscription.save
    redirect_to twitter_results_path(provider_search: params[:provider_search], provider: params[:media], provider_page: params[:provider_page])
  end

  def index
    @subscriptions = Subscription.where(user_id: session[:user_id])
    @client = set_twitter_client
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy
    redirect_to show_subscriptions_path
  end

  def feed
    @user = User.find(session[:user_id])
    @client = set_twitter_client
    @tweets = []
    @videos = []
     #iterate over all the ids and spit out the tweets for each, then push then sort
    @subscriptions = Subscription.where(user_id: session[:user_id])
    @subscriptions.each do |s|
      if s.media == "twitter"
        tweets = @client.user_timeline(s.local_id.to_i)
        @tweets.push(tweets)
      elsif s.media == "vimeo"
          videos = Vimeo::Simple::User.all_videos(s.local_id.to_i)
          @videos.push(videos.flatten)
        end
      end
    @tweets = @tweets.flatten.sort_by {|tweet| tweet.created_at}.reverse
    if @videos != nil
      @videos = @videos.flatten.sort_by {|video| video["upload_date"]}.reverse
    end
    @all = merge(@tweets, @videos)
  end

  def merge(twitter, vimeo)
    s = []
    i = 0
    while twitter.length * vimeo.length > 0
      if twitter[i].created_at > vimeo[i]['upload_date']
        s.push(twitter.shift)
      else
        s.push(vimeo.shift)
      end
    end
    s + twitter + vimeo
 end


end
