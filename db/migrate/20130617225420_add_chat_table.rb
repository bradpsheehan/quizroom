class AddChatTable < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.string :public_channel
      t.string :teacher_channel
      t.references :classroom
      t.timestamps
    end
  end


end
