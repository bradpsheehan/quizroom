class RemoveTeacherFromUsers < ActiveRecord::Migration

  def change
    remove_column :users, :teacher
  end
end
