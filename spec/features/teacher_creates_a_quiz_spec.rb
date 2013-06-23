require 'spec_helper'

describe "teacher creates a quiz" do

  xit "creates one question using the new quiz form" do
    visit root_path
    click_link "signup"
    fill_in 'user_first_name', :with => "joe"
    fill_in 'user_last_name', :with => "smith"
    fill_in 'user_email', :with => "abc@example.com"
    fill_in 'user_password', :with => "password"
    fill_in 'user_password_confirmation', :with => "password"
    click_button 'Create User'

    visit new_quiz_path
    fill_in 'quiz_name', :with => "English Final Exam"
    fill_in 'question', :with => "What is a noun?"
    fill_in 'answer', :with => "Answer1a"
    click_on "Add another answer"
    fill_in 'answer', :with => "Answer1b"

    click_link "Add Another Question"

    fill_in 'question', :with => "What is a adverb?"
    fill_in 'answer', :with => "Answer1b"
    click_link "Add another answer"
    fill_in 'answer', :with => "Answer2b"

    click_button "Save Quiz"

    expect( page ).to have_content "English Final Exam was successfully created!"



  end

end
