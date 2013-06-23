require 'spec_helper'

describe User do

  it "has a full name" do
    user = User.new(first_name: "Elaine", last_name: "Tai")
    expect(user.full_name).to eq("Elaine Tai")
  end

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
