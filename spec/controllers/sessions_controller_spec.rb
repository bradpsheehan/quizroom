require 'spec_helper'

describe SessionsController do
 let(:user_attributes) do
    {
      first_name: "joe",
      last_name: "smith",
      email: "joe@example.com",
      password: "1234",
      password_confirmation: "1234"
    }
 end

  let(:credentials) { {email: "joe@example.com", password: "1234"} }

  context "happy path" do
    it  "logs in a user with good credentials" do
      #user = User.new
      #controller.should_receive(:login).with(credentials[:email], credentials[:password]).and_return(user)
      user = Teacher.create_with_password(user_attributes)
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
