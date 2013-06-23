require 'spec_helper'

describe UserMailer do
    let(:teacher) { create_teacher(email: "teach@example.com", first_name: "Katrina") }
    let(:classroom) { Classroom.create(teacher_id: teacher.id, name: "Yoga") }

  describe ".invite_firsttime_student_to_classroom" do
    let(:student) { create_student(first_name: "Bill", email: "student@example.com") }
    let(:mail) { UserMailer.invite_firsttime_student_to_classroom(student, classroom) }

    it "renders the headers" do
      mail.subject.should eq("You've been invited to join Yoga on Quizroom")
      mail.to.should eq(["student@example.com"])
      mail.from.should eq(["no-reply@quizroom.com"])
    end
  end

  describe ".invite_student_to_classroom" do
    let(:student) { create_student(first_name: "Elaine", email: "student1@example.com") }
    let(:mail) { UserMailer.invite_student_to_classroom(student, classroom) }

    it "renders the headers" do
      mail.subject.should eq("You've been invited to join Yoga on Quizroom")
      mail.to.should eq(["student1@example.com"])
      mail.from.should eq(["no-reply@quizroom.com"])
    end
  end
end