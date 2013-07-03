class Question < ActiveRecord::Base

  attr_accessible :quiz_id, :question, :correct_answer_id

  belongs_to :quiz
  has_many :answers

  accepts_nested_attributes_for :answers

  acts_as_list scope: :quiz

  def next
    lower_item
  end

end
