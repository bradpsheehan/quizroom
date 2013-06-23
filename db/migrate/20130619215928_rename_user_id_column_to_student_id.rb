class RenameUserIdColumnToStudentId < ActiveRecord::Migration

  def change
    rename_column :classrooms_students, :user_id, :student_id
  end
end
