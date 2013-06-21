require 'spec_helper'

describe UserMailer do
    let(:teacher) { User.create(email: "teach@example.com", first_name: "Katrina") }
    let(:classroom) { Classroom.create(teacher_id: teacher.id, name: "Yoga") }

  describe ".invite_firsttime_student_to_classroom" do
    let(:student) { User.create(email: "student@example.com") }
    let(:mail) { UserMailer.invite_firsttime_student_to_classroom(student, classroom) }

    it "renders the headers" do
      mail.subject.should eq("You've been invited to join Yoga on Quizroom")
      mail.to.should eq(["student@example.com"])
      mail.from.should eq(["no-reply@quizroom.com"])
    end
  end

  describe ".invite_student_to_classroom" do
    let(:student) { User.create(email: "student@example.com", first_name: "Elaine") }
    let(:mail) { UserMailer.invite_student_to_classroom(student, classroom) }

    it "renders the headers" do
      mail.subject.should eq("You've been invited to join Yoga on Quizroom")
      mail.to.should eq(["student@example.com"])
      mail.from.should eq(["no-reply@quizroom.com"])
    end
  end
end