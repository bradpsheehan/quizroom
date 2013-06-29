class AddQuizIdToChats < ActiveRecord::Migration
  def change
    add_column :chats, :quiz_id, :integer
  end
end
