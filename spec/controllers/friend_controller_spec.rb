require 'spec_helper'

describe FriendController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'add_friend'" do
    it "should be successful" do
      get 'add_friend'
      response.should be_success
    end
  end

  describe "GET 'remove_friend'" do
    it "should be successful" do
      get 'remove_friend'
      response.should be_success
    end
  end

end
