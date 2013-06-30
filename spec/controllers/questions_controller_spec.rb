require 'spec_helper'

describe QuestionsController do 
  describe "GET #show" do 
    it "responds to json" do
      teacher = create_teacher
      quiz = create_quiz_with_question_and_answer(teacher)
      question = quiz.questions.first
      question2 = create_question("Another question", quiz)
      get :show, {quiz_id: quiz.id, id: question.id}, format: :json
      binding.pry
      json = JSON.parse(response.body).with_indifferent_access

      expect(json[:nextQuestion]).to eq(quiz_question_path(quiz, question2))
    end
  end
end
