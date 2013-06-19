class Classroom < ActiveRecord::Base
  attr_accessible :teacher_id, :name
  belongs_to :teacher, class_name: 'User'
  has_and_belongs_to_many :students, class_name: 'User',
    conditions: ['teacher = ?', false], join_table: :classrooms_users

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
