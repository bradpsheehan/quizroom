class ChangeClassroomIdToTeacherIdInQuizzes < ActiveRecord::Migration
  def change
    rename_column :quizzes, :classroom_id, :teacher_id
  end
end
