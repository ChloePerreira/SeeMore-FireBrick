require 'rails_helper'

describe SearchController do
  render_views

  describe "GET #index" do

    context "with valid query" do

      it "should render the twitter partial" do
        get(:index, {provider_search: "Cat", provider: "twitter"})
        expect(response).to render_template(:partial => '_twitter_results')
        expect(response.status).to eq 200
      end

      it "should render the vimeo partial" do
        get(:index, {provider_search: "brthr", provider: "vimeo"})
        expect(response).to render_template(:partial => '_vimeo_results')
        expect(response.status).to eq 200
      end
    end

    context "with invalid query" do
      it "should render home index page with notice if an empty string is submitted as query" do
        get(:index, {twitter_search: ""})
        expect(response.status).to eq 200
      end
    end

  end

end
