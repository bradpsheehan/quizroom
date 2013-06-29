require 'spec_helper'

describe "student enters chat" do

  it "student can enter into a chat that is in session" do
    teacher = create_teacher
    quiz = create_quiz(teacher)
    classroom = Classroom.create(name: "English 101", teacher_id: 1)
    chat = Chat.create(classroom_id: classroom.id, quiz_id: quiz.id)
    student = create_student(first_name: "Bob", last_name: "Jones", email: "bob@example.com")
    classroom.students << student
    visit login_path
    fill_in :email, with: student.email
    fill_in :password, with: "1234"
    click_button "login"

    click_link "English 101"
    expect(page).to have_selector("#answer")
  end
end
