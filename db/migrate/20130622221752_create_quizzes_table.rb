class CreateQuizzesTable < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.integer :classroom_id
      t.string :name
      t.timestamps
    end
  end
end
