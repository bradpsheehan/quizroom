require 'spec_helper'

describe StudentsController do
  describe "POST #create" do

    before do
      @teacher = create_teacher("fred", "flinstone", "fflinstone@example.com", "")
      controller.stub(:require_login).and_return(true)
      controller.stub(:current_user).and_return(@teacher)
    end

    it "creates a student and adds them to classroom" do
      classroom = Classroom.create(name: "sports", teacher_id: @teacher.id)

      expect {
        post :create, {classroom_id: classroom.id, students: "danny@mail.com, erin@mail.com"}
      }.to change {User.count}.by(2)

      danny = User.find_by_email('danny@mail.com')
      erin = User.find_by_email('erin@mail.com')
      expect(danny).to_not be_nil
      expect(erin).to_not be_nil

      expect(classroom.reload.students.length).to eq 2
      expect(classroom.reload.students).to include(erin)
      expect(classroom.reload.students).to include(danny)
    end
  end

end