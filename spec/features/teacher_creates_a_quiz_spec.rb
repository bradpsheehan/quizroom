require 'spec_helper'

describe "teacher creates a quiz", js: true do

  it "creates one question using the new quiz form" do
    teacher = Teacher.new(first_name: "Teach", last_name: "Name", email:"abc@example.com")
    teacher.password = "1234"
    teacher.password_confirmation = "1234"
    teacher.save
    classroom = Classroom.create!(name: "Class1", teacher_id: teacher.id)
    visit login_path

    fill_in 'email', :with => "abc@example.com"
    fill_in 'password', :with => "1234"
    click_button 'login'

    visit classroom_path(classroom)

    fill_in 'quiz_name', :with => "English Final Exam"
    click_button 'Create Quiz'
    fill_in 'question_question', :with => "What is a noun?"
    click_link 'Add Answer'
    fill_in 'answers[answer2]', :with => "Answer1a"
    click_link 'Add Answer'
    fill_in 'answers[answer3]', :with => "Answer1b"

    choose 'option1'

    click_button "Add Another Question"

    question = Question.first

    within "#question_#{question.id}" do
      expect(page).to have_content("What is a noun?")
      expect(page).to have_content("Answer1b")

      within '.correct-answer' do
        expect(page).to have_content("Answer1a")
      end
    end

    #fill_in 'question', :with => "What is a adverb?"
    #fill_in 'answer', :with => "Answer1b"
    #click_link "Add another answer"
    #fill_in 'answer', :with => "Answer2b"

    #click_button "Save Quiz"

    #expect( page ).to have_content "English Final Exam was successfully created!"



  end

end
