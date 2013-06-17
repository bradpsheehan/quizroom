require 'spec_helper'

describe "Instructor login and logout" do
  it "successfully logs in and logs out" do
    u = User.new(first_name: "joe", last_name:"smith", email: "abc@example.com")
    u.password = "password"
    u.password_confirmation = "password"
    u.save!

    visit root_path
    click_link "login"
    fill_in 'email', :with => "abc@example.com"
    fill_in 'password', :with => "password"
    click_button 'login'
    expect( page ).to have_content 'Logged In!'
    expect( page ).to have_link 'New Classroom'

    click_link "logout"
    expect(page).to have_content 'Logged Out!'
    expect(current_path).to eq root_path

  end
end
