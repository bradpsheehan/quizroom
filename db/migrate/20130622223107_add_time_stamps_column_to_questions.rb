class AddTimeStampsColumnToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :created_at, :datetime, null: false
    add_column :questions, :updated_at, :datetime, null: false
  end
end
