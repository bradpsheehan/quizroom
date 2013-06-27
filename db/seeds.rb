teacher = Teacher.create do |teacher|
  teacher.first_name =  "teacher1"
  teacher.last_name = "smith"
  teacher.email = "smith101@mail.com"
  teacher.password = "password"
  teacher.password_confirmation = "password"
end

student = Student.create do |student|
  student.first_name =  "student"
  student.last_name = "smith"
  student.email = "student@mail.com"
  student.password = "password"
  student.password_confirmation = "password"
end

classroom = Classroom.create do |classroom|
  classroom.teacher = teacher
  classroom.students << student
  classroom.name = "class 1"
end

quiz = Quiz.create do |quiz|
  quiz.teacher = teacher
  quiz.name = "quiz 1"
end

question1 = Question.create do |q|
  q.question = "What color is the sky?"
  q.quiz = quiz
end

answer1 = Answer.create do |a|
  a.question = question1
  a.answer = "blue"
  a.correct_answer = true
end

answer2 = Answer.create do |a|
  a.question = question1
  a.answer = "polka dot red"
end

question2 = Question.create do |q|
  q.question = "What is 2 + 2"
  q.quiz = quiz
end

answer3 = Answer.create do |a|
  a.question = question2
  a.answer = "-1235123"
end

answer2 = Answer.create do |a|
  a.question = question2
  a.answer = "4"
  a.correct_answer = true
end
