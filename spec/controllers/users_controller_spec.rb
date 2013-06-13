require 'spec_helper'

describe UsersController do
  describe "#create" do
    context "valid user info" do
      it "creates a user" do
         expected_attrs = {
          "first_name" => "joe",
          "last_name" => "smith",
          "email" => "joe@example.com",
          "password" => "1234",
          "password_confirmation" => "1234"
        }

         user_attributes = {
          first_name: "joe",
          last_name: "smith",
          email: "joe@example.com",
          password: "1234",
          password_confirmation: "1234"
        }

        User.should_receive(:create_with_password).with(expected_attrs).and_return(User.new)
        post :create, user: user_attributes
      end

    end

    context "invalid user info" do
      it "directs them to the signup page"
    end
  end
end
