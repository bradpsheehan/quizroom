require 'spec_helper'
describe Student do
  describe ".find_or_create_students" do
    context "with one student who doesn't exist" do
      attributes = "ed@example.com"
      it "creates a user" do
        expect{Student.find_or_create_students(attributes)}.to change{Student.count}.by(1)
      end
    end

    context "with multiple students who don't exist" do
      it "creates the users" do
        attributes = "ed@example.com, dick@example.com"
        users = Student.find_or_create_students(attributes)
        expect(Student.pluck(:email)).to include("dick@example.com")
      end
    end

    context "with a student who already exists in the db" do
      before do
        student = Student.new(email: "blair@kale.com")
        student.password = "password"
        student.password_confirmation = student.password
        student.save
      end

      context "with one student who already exists" do
        it "does not create a new student" do
          attributes = "blair@kale.com"
          user = Student.find_or_create_students(attributes)
          expect{user}.to_not change{Student.count}.by(1)
        end
      end

      context "with multiple students, one of whom already exists" do
        it "creates only the new students" do
          attributes = "blair@kale.com, danny@meat.com"
          expect{Student.find_or_create_students(attributes)}.to change{Student.count}.by(1)
        end
      end
    end
  end
end
