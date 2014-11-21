class SearchController < ApplicationController

  def index
    if params[:provider] == "twitter"
      @response = search_twitter_user
      results
      render "_twitter_results"
    elsif params[:provider] == "vimeo"
      @response = search_vimeo_user
      results
      render "_vimeo_results"
    end
  end

  def results
    @query = params[:provider_search]
    # @current_page = @provider_page
    # @previous_page = @current_page - 1
    # @next_page = @current_page + 1

  end

  def search_twitter_user
    set_twitter_client
    @provider_page = params[:provider_page].to_i

    if @provider_page == 0
      @provider_page = 1
    end

    @query = params[:provider_search]
    set_twitter_client.user_search(@query, {page: @provider_page})
  end

  def search_vimeo_user
    @query = Beemo::User.search(params[:provider_search])
  end
end
