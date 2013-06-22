require 'spec_helper'

describe StudentsController do
  describe "POST #create" do
    it "creates a student and adds them to classroom" do
      classroom = Classroom.create(teacher_id: 1, name: "Sports")

      User.should_receive(:find_or_create_students)
      post :create, {classroom_id: classroom.id, students: "danny@mail.com, erin@mail.com"}

    end
  end

end