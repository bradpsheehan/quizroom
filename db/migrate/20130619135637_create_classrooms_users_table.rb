class CreateClassroomsUsersTable < ActiveRecord::Migration

  def change
    create_table :classrooms_users do |t|
      t.references :user
      t.references :classroom
    end
  end
end
