require 'spec_helper'

describe "student enters chat" do

  it "student can enter into a chat that is in session" do
    #create a classroom
    classroom = Classroom.create(name: "English 101", teacher_id: 1)
    #create a chat
    chat = Chat.create(classroom_id: classroom.id)
    #create a student
    student = Student.new(first_name: "Bob", last_name: "Jones", email: "bob@example.com")
    student.password = "1234"
    student.password_confirmation = "1234"
    student.save
    #add student to the class
    classroom.students << student
    #navigate to classroom/chat
    visit login_path
    fill_in :email, with: student.email
    fill_in :password, with: "1234"
    click_button "login"

    click_link "English 101"
    expect( page ).to have_selector("#chat")
    #expect to be in a chat
  end
end
