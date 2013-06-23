require 'spec_helper'

describe 'adding students to a class' do

  it 'adds newly created students and sends an email' do
    ActionMailer::Base.deliveries = []

    teacher_email = "abc@example.com"
    teacher_password = "password"

    teacher = create_teacher(first_name: "joe", last_name: "smith", email: teacher_email, password: teacher_password)
    classroom = teacher.classrooms.create!(name: 'English for Rockstars')

    login_user_post(teacher_email, teacher_password)

    visit classroom_path(classroom)

    click_link('Add Students')
    fill_in('students', with: 'student1@example.com, student2@example.com')

    click_button('Add Students')

    expect(page).to have_content('student1@example.com')
    expect(page).to have_content('student2@example.com')

    expect(ActionMailer::Base.deliveries.length).to eq 2
  end
end
