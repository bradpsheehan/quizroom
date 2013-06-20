require 'spec_helper'

describe UserMailer do

  describe ".invite_students_to_classroom" do
    let(:user1) { User.create(email: "student1@example.com") }
    let(:user2) { User.create(email: "student2@example.com") }
    let(:students) { [user1.id, user2.id] }
    let(:classroom) { Classroom.create(teacher_id: 1, name: "Yoga") }
    let(:mail) { UserMailer.invite_students_to_classroom(students, classroom) }

    it "renders the headers" do
      mail.subject.should eq("You've been invited to join Yoga on Quizroom")
      mail.to.should eq(["student2@example.com"])
      mail.from.should eq(["no-reply@quizroom.com"])
    end
  end
end