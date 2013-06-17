require 'spec_helper'

describe SessionsController do

  let(:credentials) { {email: "abc@example.com", password: "password"} }
  context "happy path" do
    it  "logs in a user with good credentials" do
      user = User.new
      controller.should_receive(:login).with(credentials[:email], credentials[:password]).and_return(user)
      post :create, credentials
      expect( response ).to redirect_to(user)
    end
  end

  context "invalid information" do
    it "doesn't login with bad credentials" do
      controller.should_receive(:login).with(credentials[:email], credentials[:password])
      post :create, credentials
      expect(response).to redirect_to(login_path)
    end
  end
end
