require 'spec_helper'

describe "creates a classroom" do
  it "creates a classroom with a logged in teacher" do
    u = Teacher.new(first_name: "joe", last_name:"smith", email: "abc@example.com")
    u.password = "password"
    u.password_confirmation = "password"
    u.save!

    login_user_post(u.email, "password")

    visit new_classroom_path
    fill_in 'class_name', :with => "English for Rockstars"
    click_button 'create'

    expect(page).to have_content("English for Rockstars")
  end

  it "doesnt let an unauthenticated visitor create a classroom" do
    visit new_classroom_path
    expect(current_path).to eq root_path
  end

  it "doesn't let an unauthorized user create a classroom" do
    u = User.new(first_name: "joe", last_name:"smith", email: "blah@example.com")
    u.password = "password"
    u.password_confirmation = "password"
    u.save!

    login_user_post(u.email, "password")

    visit new_classroom_path

    expect(current_path).to eq root_path
  end
end
