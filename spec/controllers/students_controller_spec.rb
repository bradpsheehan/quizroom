require 'spec_helper'

describe StudentsController do
  describe "POST #create" do

    before do
      @teacher = User.create(first_name: "fred", last_name: "flinstone",
                             email: "fflinstone@example.com",
                             teacher: true
                            )
      controller.stub(:require_login).and_return(true)
      controller.stub(:current_user).and_return(@teacher)
    end

    xit "creates a student and adds them to classroom" do
      classroom = Classroom.create(name: "sports", teacher_id: @teacher.id)
      classroom.stub(:members).and_return(@teacher)

      post :create, {classroom_id: classroom.id, students: "danny@mail.com, erin@mail.com"}
      User.should_receive(:find_or_create_students)
      .with(student_emails: "danny@mail.com, erin@mail.com")
    end
  end

end