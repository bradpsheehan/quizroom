class Classroom < ActiveRecord::Base
  attr_accessible :teacher_id, :name
  belongs_to :teacher
  has_one :chat
  has_and_belongs_to_many :students
  has_many :quizzes

  def add_students(student_ids)

    student_ids.each do |id|
      user = Student.find_by_id(id)
      if user
        students << user
      end
    end

    save
  end

  def in_session?
    !chat.nil?
  end

end
