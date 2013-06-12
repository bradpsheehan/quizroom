class SorceryCore < ActiveRecord::Migration
  def change
    add_column :users, :crypted_password, :string, default: nil
    add_column :users, :salt, :string, default: nil
    add_column :users, :created_at, :datetime
    add_column :users, :updated_at, :datetime
     
  end

end
