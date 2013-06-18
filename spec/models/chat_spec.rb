require 'spec_helper'

describe Chat do
  it "generates a unique public_channel for the chat" do
    teacher = User.new(teacher: true, first_name: "jane", last_name: "doe", email: "jane@example.com")
    teacher.password = "password"
    teacher.password_confirmation = "password"
    teacher.save!

    classroom = Classroom.create(teacher.id, "English 101")

    chat = Chat.create(classroom_name: classroom.name, classroom_id: classroom.id)

    key = "English 101 #{teacher.id}"

    expect(chat.public_channel).to eq("public-#{Digest::SHA1.hexdigest key}")
  end
end
