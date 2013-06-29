module ObjectCreationMethods
  def create_teacher(first_name: "Teach", last_name: "Name", email: "teacher@example.com", password: "1234")
    u = Teacher.create! do |u|
        u.first_name = first_name
        u.last_name = last_name
        u.email = email
        u.password = password
        u.password_confirmation = password
    end
  end

  def create_student(first_name: "Student", last_name: "Name", email: "student@example.com", password: "1234")
    u = Student.create! do |u|
        u.first_name = first_name
        u.last_name = last_name
        u.email = email
        u.password = password
        u.password_confirmation = password
    end
  end

  def create_classroom(teacher, name="class 1")
    classroom = Classroom.create do |classroom|
      classroom.teacher = teacher
      classroom.name = name
    end
  end


  def create_quiz(teacher, name="quiz 1")
    quiz = Quiz.create do |quiz|
      quiz.teacher = teacher
      quiz.name = name
    end
  end

  def create_quiz_with_question_and_answer(teacher, name="quiz 1")
    quiz = create_quiz(teacher, name)
    quiz.questions << create_question_with_answer("What time is it?", quiz)
    quiz
  end

  def create_question(question, quiz)
    question1 = Question.create do |q|
      q.question = question
      q.quiz = quiz
    end
  end

  def create_question_with_answer(question, quiz)
    q = create_question(question, quiz)
    q.answers << create_answer(q, "blue", true)
    q
  end

  def create_answer(question, answer, correct_answer=false)
    answer1 = Answer.create do |a|
      a.question = question
      a.answer = answer
      a.correct_answer = correct_answer
    end
  end
end
