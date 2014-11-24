require 'rails_helper'

RSpec.describe SubscriptionsController, :type => :controller do

  describe "POST create" do

    context "with valid attributes" do
      it "should save into database" do
        expect {
          post :create, {subscription:{user_id: 8, media: "twitter", local_id: "207550006"}}
        }.to change {Subscription.count}.by(1)
        expect(Subscription.find_by user_id: 8).not_to eq nil
      end
    end

    context "with invalid attributes" do
      it "does not save the item" do
        expect {
          post :create, {subscription:{user_id: nil, media: "twitter", local_id: "307550006"}}
        }.to change {Subscription.count}.by(0)
      end
    end
  end

  describe "GET index" do
    it "should return an index page" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET feed" do
    it "should return an feed page" do
      get :feed
      expect(response.status).to eq 200
    end

  end

end
