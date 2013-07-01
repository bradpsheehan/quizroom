class Question < ActiveRecord::Base

  attr_accessible :quiz_id, :question, :correct_answer_id

  belongs_to :quiz
  has_many :answers

  accepts_nested_attributes_for :answers

  # controller method here
  #  question.update(params[:question])
  #  params[:question] = {question: test}
  #  params[:question] = {answer_id: 1}
  #  questions_question <- either form or value needs to look like that

end
