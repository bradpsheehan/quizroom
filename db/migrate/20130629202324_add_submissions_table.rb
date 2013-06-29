class AddSubmissionsTable < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.timestamps

      t.references :student
      t.references :answer
    end

    add_index :submissions, :student_id
    add_index :submissions, :answer_id
  end
end
