require 'spec_helper'

describe "Instructor signup" do
  it "successfully signs up" do
    visit root_path
    click_link "signup"
    fill_in 'user_email', :with => "abc@example.com"
    fill_in 'user_password', :with => "password"
    fill_in 'user_password_confirmation', :with => "password"
    click_button 'Create User'
    expect( page ).to have_content 'Signed In!'
    # expect( current_path ).to eq user_path(user)
    expect( page ).to have_link 'create classroom'
  end
end

