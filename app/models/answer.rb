class Answer < ActiveRecord::Base

  attr_accessible :question_id, :answer, :correct_answer

  belongs_to :question

end
