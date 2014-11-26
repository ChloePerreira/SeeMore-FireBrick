require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  describe "Authentications" do

    # it "can sign in user with twitter account" do
    #
    # end

    it "a user can sign out" do
      session[:user_id] = 4
      post :destroy
      expect(session[:user_id]).to eq nil
    end

    # it "a user can link to another account once they are signed in" do
    # end

  end

end
