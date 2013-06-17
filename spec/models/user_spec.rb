require 'spec_helper'

describe User do
  describe ".create_with_password" do
    it "creates a user" do
      attributes = {
        first_name: "Joe",
        last_name: "Smith",
        email: "abc@example.com",
        password: "password",
        password_confirmation: "password"
      }
      expect{User.create_with_password(attributes )}.to change{User.count}.by(1)
    end
  end

  describe ".find_or_create_students" do
    context "with one student who doesn't exist" do
      attributes = "ed@example.com"
      it "creates a user" do
        expect{User.find_or_create_students(attributes)}.to change{User.count}.by(1)
      end
    end

    context "with multiple students" do
      it "creates the users" do

      end
    end
  end
end
