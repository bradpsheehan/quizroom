class Question < ActiveRecord:BASE

  belongs_to :quiz
  has_many :answers

end
