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

    context "with multiple students who don't exist" do
      it "creates the users" do
        attributes = "ed@example.com, dick@example.com"
        users = User.find_or_create_students(attributes)
        expect(User.pluck(:email)).to include("dick@example.com")
      end
    end

    context "with one student who already exists in the db" do
      before do
        student = User.new(email: "blair@kale.com")
        student.password = "password"
        student.password_confirmation = student.password
        student.save
      end

      it "does not create a new student" do
        attributes = "blair@kale.com"
        user = User.find_or_create_students(attributes)
        expect{user}.to_not change{User.count}.by(1)
      end
    end
  end
end
