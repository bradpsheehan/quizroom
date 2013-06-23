class CreateAnswersTable < ActiveRecord::Migration
  def up
    create_table :answers do |t|
      t.integer :question_id
      t.text :answer
      t.boolean :correct_answer, default: false
    end
  end
end
