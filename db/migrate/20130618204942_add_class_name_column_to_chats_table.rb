class AddClassNameColumnToChatsTable < ActiveRecord::Migration
  def change
    add_column :chats, :classroom_name, :integer
  end
end
