class UserMailer < ActionMailer::Base
  default from: "no-reply@quizroom.com"

  def invite_students_to_classroom(students, classroom)
    @classroom = classroom

    students.each do |student|
      @student = User.find(student)
      mail(to: @student.email, subject: "You've been invited to join Yoga on Quizroom")
    end
  end
end