require 'spec_helper'

describe StudentsController do
  describe "POST #create" do
    xit "sends the student ids to UserMailer" do
      classroom = Classroom.create(teacher_id: 1, name: "Sports")

      UserMailer.should_receive(:invite_students_to_classroom)
      post :create, {classroom_id: classroom.id, students: "danny@mail.com, erin@mail.com"}
    end
  end

end