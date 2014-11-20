class SubscriptionsController < ApplicationController

  #showing a user https://api.twitter.com/1.1/users/show.json?screen_name=crystaloptera
  #showing a user's tweets https://api.twitter.com/1.1/statuses/user_timeline.json?count=200&user_id=2788167642

  def create
    @subscription = Subscription.new(type: params[:subscription][:type], local_id: params[:subscription][:local_id], user_id: session[:user_id]) #pass in type and local_id via params
    if @subscription.save
      redirect_to feed_path #make this path
    else
      render :new #this may be problematic
    end
  end

  def show

  end


    #query = params[:twitter_search]
    #response = HTTParty.get(" https://api.twitter.com/1.1/users/show.json?screen_name=#{query}")

end
