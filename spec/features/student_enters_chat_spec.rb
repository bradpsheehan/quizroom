require 'spec_helper'

describe "student enters chat" do

  it "student can enter into a chat that is in session" do
    classroom = Classroom.create(name: "English 101", teacher_id: 1)
    chat = Chat.create(classroom_id: classroom.id)
    student = Student.new(first_name: "Bob", last_name: "Jones", email: "bob@example.com")
    student.password = "1234"
    student.password_confirmation = "1234"
    student.save
    classroom.students << student
    visit login_path
    fill_in :email, with: student.email
    fill_in :password, with: "1234"
    click_button "login"

    click_link "English 101"
    expect(page).to have_selector("#answer")
  end
end
