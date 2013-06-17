class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :first_name, :last_name, :email, :teacher
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password

  def self.create_with_password(user_attributes)
    password = user_attributes.delete(:password)
    password_confirmation = user_attributes.delete(:password_confirmation)
    user = User.new(user_attributes)
    user.password = password
    user.password_confirmation = password_confirmation
    user.save
    user
  end

  def self.find_or_create_students(student_emails)
    emails = student_emails.split(", ")
    emails -= self.pluck(:email)
    emails.each do |email|
      user = User.new(email: email)
      user.password = email.split("@")[0]
      user.password_confirmation = user.password
      user.save
    end
  end
end
