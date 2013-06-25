class AddTeacherToQuiz < ActiveRecord::Migration
  def change
    add_column :quizzes, :teacher_id, :integer
  end
end
