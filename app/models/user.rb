class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :first_name, :last_name, :email
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password

  def self.create_with_password(user_attributes)
    password = user_attributes.delete(:password)
    password_confirmation = user_attributes.delete(:password_confirmation)
    user = User.new(user_attributes)
    user.password = password
    user.password_confirmation = password_confirmation
    user.save
  end

end
