class Classroom < ActiveRecord::Base
  attr_accessible :teacher_id, :name
  has_and_belongs_to_many :students, class_name: 'User'

  def add_students(student_ids)

    student_ids.each do |id|
      user = User.find_by_id(id)
      if user
        students << user
      end
    end

    save
  end

end
