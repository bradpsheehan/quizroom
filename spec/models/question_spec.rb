require 'spec_helper'

describe Question do
  describe "#next" do
    it "knows the next question" do
      teacher = create_teacher
      quiz = create_quiz(teacher)
      question = create_question("hello?", quiz)
      question2 = create_question("hello2?", quiz)

      expect(question.next).to eq(question2)
    end
  end
end