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

end
