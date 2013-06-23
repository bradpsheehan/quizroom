class CreateQuestionsTable < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :quiz_id
      t.text :question
    end
  end
end
