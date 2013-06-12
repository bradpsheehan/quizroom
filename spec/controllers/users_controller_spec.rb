require 'spec_helper'

describe UsersController do
  describe "#create" do
    context "valid user" do
      it "creates a user" do
        expected_attrs = {
          "first_name" => "joe",
          "last_name" => "smith",
          "email" => "joe@example.com"
        }

         user_attributes = {
          first_name: "joe",
          last_name: "smith",
          email: "joe@example.com",
          password: "1234",
          password_confirmation: "1234"
        }

        User.should_receive(:create).with(expected_attrs).and_return(User.new)
        post :create, user: user_attributes
      end

      it "sets the password" do
      end
      
      it "directs them to the user's page"
    end

    context "invalid user" do
      it "directs them to the signup page"
    end
  end
end
