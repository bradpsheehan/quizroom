class QuestionsController < ApplicationController

  respond_to :json

  def create

    @question = Question.create!(quiz_id: params[:quiz_id], question: params[:question][:question])
    answer = @question.answers.create(question_id: @question.id, answer: params[:answer])
    respond_with @question, location: quiz_question_path(@question.quiz_id, @question)
  end

  def show
    @question = Question.find(params[:id])
    next_question = @question.next
    response = if next_question
      {question: @question, answers: @question.answers, nextQuestion: quiz_question_path(next_question.quiz_id, next_question) }
    else
      {question: @question, answers: @question.answers}
    end
    respond_with response
  end

  def update
    @question = Question.find(params[:id])
    @question.update_attributes(params[:question])
    respond_with @question, location: quiz_question_path(@question.quiz_id, @question)


  end
end
