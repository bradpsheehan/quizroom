require 'spec_helper'

describe 'student completes account registration' do

  it 'adds a password, first name, and last name to a student account' do
    u = User.create(email: "abc@example.com")

    visit complete_signup_path(u.id)
    save_and_open_page
    fill_in 'user_first_name', :with => "joe"
    fill_in 'user_last_name', :with => "smith"
    fill_in 'user_password', :with => "password"
    fill_in 'user_password_confirmation', :with => "password"

    click_button("Update User")

    expect(page).to have_content('Account creation successful')
  end
end