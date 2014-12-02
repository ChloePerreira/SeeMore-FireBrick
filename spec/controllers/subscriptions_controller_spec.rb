require 'rails_helper'

RSpec.describe SubscriptionsController, :type => :controller do

  describe "POST create" do

    context "with valid attributes" do
      it "should save into database" do
        session[:user_id] = 8
        expect {
          post :create, {user_id: 8, media: "twitter", local_id: "207550006"}
        }.to change {Subscription.count}.by(1)
        expect(Subscription.find_by user_id: 8).not_to eq nil
      end

      # it 'should not be able to subscribe to the same account twice' do
      #   Subscription.create(user_id: 7, media: "twitter", local_id: "307550006")
      #   expect(Subscription.create(user_id: 7, media: "twitter", local_id: "307550006").valid?).to eq false
      # end
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
    it "should return a feed page" do
      user = User.create
      session[:user_id] = user.id
      get :feed
      expect(response.status).to eq 200
    end
  end

end
