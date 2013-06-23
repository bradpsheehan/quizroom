class Classroom < ActiveRecord::Base
  attr_accessible :teacher_id, :name
  belongs_to :teacher
  has_one :chat
  has_and_belongs_to_many :students

  def add_students(student_ids)
    student_ids.each do |id|
      user = Student.find_by_id(id)
      if user
        students << user
        send_classroom_confirmation_email(user)
      end
    end

    save
  end

  def members
    all_users = students.to_a
    all_users << teacher
  end

  def send_classroom_confirmation_email(student)
    if student.first_name
      UserMailer.delay.invite_student_to_classroom(student, self)
    else
      UserMailer.delay.invite_firsttime_student_to_classroom(student, self)
    end

  end


  def in_session?
    !chat.nil?
  end
end
