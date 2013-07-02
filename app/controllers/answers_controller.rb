class AnswersController < ApplicationController

  respond_to :json

  def create
    @answer = Answer.create(question_id: params[:question_id],
                            answer: params[:answer])
    respond_with @answer, location: quiz_question_answer_path(@answer.question.quiz_id, @answer.question, @answer)
  end

  def update
    @answer = Answer.find(params[:id])
    @answer.update_attributes(answer: params[:answer])
    respond_with @answer, location: quiz_question_answer_path(@answer.question.quiz_id, @answer.question_id)
  end

  def destroy
    @answer = Answer.find(params[:id]).delete
    @question = Question.find_by_id(params[:question_id])

    respond_with @question, location: quiz_question_path(@question.quiz_id, @question.id)
  end

end
