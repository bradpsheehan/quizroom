require 'spec_helper'

describe "teacher posts a message", js: true do

  it "opens a chat with a quiz" do
    teacher = create_teacher
    quiz = create_quiz_with_question_and_answer(teacher)
    question = quiz.questions.first
    answer = question.answers.first
    classroom = create_classroom(teacher)

    visit root_path
    click_link "login"
    fill_in 'email', :with => teacher.email
    fill_in 'password', :with => "1234"
    click_button 'login'

    visit classroom_path(classroom)

    click_button "open"
    click_link "Start"
    expect(page).to have_content(quiz.name)
    expect(page).to have_content(question.question)
    expect(page).to have_content(answer.answer)

  end
end


