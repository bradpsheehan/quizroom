class AnswersController < ApplicationController

  respond_to :json

  def create
    @answer = Answer.create(question_id: params[:question_id],
                            answer: params[:answer],
                            correct_answer: params[:correct_answer])
    respond_with @answer, location: quiz_question_answer_path(@answer.question.quiz_id, @answer.question, @answer)
  end

end
