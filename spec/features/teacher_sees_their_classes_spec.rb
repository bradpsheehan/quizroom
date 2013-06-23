require 'spec_helper'

describe "teacher posts a message", js: true do

  it "it posts a message to the classroom" do
    visit root_path
    click_link "signup"
    fill_in 'user_first_name', :with => "joe"
    fill_in 'user_last_name', :with => "smith"
    fill_in 'user_email', :with => "abc@example.com"
    fill_in 'user_password', :with => "password"
    fill_in 'user_password_confirmation', :with => "password"
    click_button 'Create User'

    visit new_classroom_path
    fill_in 'class_name', :with => "English"
    click_button 'create'

    within '.side-nav' do
      expect( page ).to have_content "English"
    end

    click_link "New Classroom"
    fill_in 'class_name', :with => "Math"
    click_button 'create'

    within '.side-nav' do
      expect( page ).to have_content "English"
      expect( page ).to have_content "Math"
    end
  end
end

