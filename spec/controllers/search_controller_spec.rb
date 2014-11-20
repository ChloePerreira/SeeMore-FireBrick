require 'rails_helper'

describe SearchController do
  describe "GET #index" do

    it "should render search page with notice if an empty string is submitted as query" do
      get(:index, {twitter_search: ""})

      expect(response.status).to eq 200
    end
  end
end
