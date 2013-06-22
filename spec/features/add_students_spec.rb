require 'spec_helper'

describe 'adding students to a class' do
  def create_teacher(first_name, last_name, email, password)
    u = User.create! do |u|
        u.first_name = first_name
        u.last_name = last_name
        u.email = email
        u.password = password
        u.password_confirmation = password
        u.teacher = true
    end
  end

  def create_student(fist_name, email)
    User.create(first_name: first_name, email: email)
  end

  it 'adds newly created students and sends an email' do
    teacher_email = "abc@example.com"
    teacher_password = "password"

    teacher = create_teacher("joe", "smith", teacher_email, teacher_password)
    classroom = teacher.classrooms.create!(name: 'English for Rockstars')
    # Why do we need this?
    classroom.teacher_id = teacher.id
    classroom.save!

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
