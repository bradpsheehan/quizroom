require 'spec_helper'

describe UsersController do
  describe "#create" do
   let(:expected_attrs) do
     {
        "first_name" => "joe",
        "last_name" => "smith",
        "email" => "joe@example.com",
        "password" => "1234",
        "password_confirmation" => "1234"
      }
   end

   let(:user_attributes) do
      {
        first_name: "joe",
        last_name: "smith",
        email: "joe@example.com",
        password: "1234",
        password_confirmation: "1234"
      }
   end

    context "valid user info" do
      it "creates a user" do
        #user = Teacher.new
        #user.stub(:valid?).and_return(true)
        #Teacher.stub(:create_with_password).with(expected_attrs).and_return(user)
        post :create, user: user_attributes
        teacher = Teacher.last
        expect(response).to redirect_to(user_path(teacher.id))

      end
    end

    context "invalid user info" do
      it "directs them to the signup page" do

        user = stub(:user, valid?: false)
        Teacher.stub(:create_with_password).with(expected_attrs).and_return(user)
        post :create, user: user_attributes
        expect(response).to redirect_to(signup_path)
      end
    end
  end
end
