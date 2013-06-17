require 'spec_helper'

describe "creates a classroom" do
  xit "creates a classroom with a logged in teacher" do
    VCR.use_cassette("create classroom feature spec") do
      u = User.new(first_name: "joe", last_name:"smith", email: "abc@example.com")
      u.password = "password"
      u.password_confirmation = "password"
      u.save!



      login_user_post(u.email, "password")

      visit new_classroom_path
      fill_in 'class_name', :with => "English"
      click_button 'create'

      uri = URI.parse(current_url)
      binding.pry
      expect(current_path).to eq uri.path
    end
  end

  it "doesnt let an unauthenticated visitor create a classroom"
end
