class UserMailer < ActionMailer::Base
  default from: "no-reply@quizroom.com"

  def invite_student_to_classroom(student, classroom)
    @classroom = classroom
    @student = User.find(student)
    mail(to: @student.email, subject: "You've been invited to join #{classroom.name} on Quizroom")
  end

  def invite_firsttime_student_to_classroom(student, classroom)
    @classroom = classroom
    @student = User.find(student)
    mail(to: @student.email, subject: "You've been invited to join #{classroom.name} on Quizroom")
  end
end