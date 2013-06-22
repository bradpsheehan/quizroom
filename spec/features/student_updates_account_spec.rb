require 'spec_helper'

describe 'student completes account registration' do

  xit 'adds a password, first name, and last name to a student account' do
    u = User.create(email: "abc@example.com")
    # login_user_post(u.email, "password")
    @classroom = Classroom.create(teacher_id: 1, name: "math")
    @classroom.add_students([u.id])

    visit complete_signup_path(u.id, @classroom.id)
    fill_in 'user_first_name', :with => "joe"
    fill_in 'user_last_name', :with => "smith"
    fill_in 'user_password', :with => "password"
    fill_in 'user_password_confirmation', :with => "password"
    hidden_field = find :xpath, "//input[@id='redirect_to_class']"
    hidden_field.set "#{@classroom.id}"

    click_button("Update User")
    expect(page).to have_content('Account creation successful')
  end
end