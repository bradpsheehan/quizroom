require 'spec_helper'

describe "Instructor login" do
  it "successfully logs in" do
    visit root_path
    click_link "login"
    fill_in 'email', :with => "abc@example.com"
    fill_in 'password', :with => "password"
    click_button 'login'
    expect( page ).to have_content 'Logged In!'
    # expect( current_path ).to eq user_path(user)
    expect( page ).to have_link 'create classroom'
  end
end
