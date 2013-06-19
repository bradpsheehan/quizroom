class RenameClassroomsUsersToClassroomsStudents < ActiveRecord::Migration
  def change
    rename_table :classrooms_users, :classrooms_students
  end
end
