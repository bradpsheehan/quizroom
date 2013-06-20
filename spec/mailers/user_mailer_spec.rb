require 'spec_helper'

describe UserMailer do

  describe ".invite_students_to_classroom" do
    let(:student) { User.create(email: "student@example.com") }
    let(:classroom) { Classroom.create(teacher_id: 1, name: "Yoga") }
    let(:mail) { UserMailer.invite_student_to_classroom(student, classroom) }

    it "renders the headers" do
      mail.subject.should eq("You've been invited to join Yoga on Quizroom")
      mail.to.should eq(["student@example.com"])
      mail.from.should eq(["quizroom@quizroom.com"])
    end
  end
end