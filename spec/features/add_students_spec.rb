require 'spec_helper'

describe 'add students to a class' do

  it 'adds students to a class' do
    u = User.new(first_name: "joe", last_name:"smith", email: "abc@example.com")
    u.password = "password"
    u.password_confirmation = "password"
    u.teacher = true
    u.save!
    u2 = User.create(first_name: "brad", email: "student3@example.com")

    login_user_post(u.email, "password")

    classroom = Classroom.create(teacher_id: u.id, name: "English")
    visit classroom_path(classroom.id)

    click_link('Add Students')
    fill_in('students', with: 'student1@example.com, student2@example.com')

    click_button('Add Students')

    expect(page).to have_content('student1@example.com')
    expect(page).to have_content('student2@example.com')

    click_link('Add Students')
    fill_in('students', with: 'student3@example.com')

    click_button('Add Students')

    expect(page).to have_content('student3@example.com')
  end
end
