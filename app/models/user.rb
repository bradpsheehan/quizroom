class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :first_name, :last_name, :email, :teacher
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password

  has_and_belongs_to_many :classrooms

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
    emails = split_emails(student_emails)
    new_students = emails - self.pluck(:email)
    new_students.each do |email|
      user = User.new(email: email)
      user.password = email.split("@")[0]
      user.password_confirmation = user.password
      user.save
    end
    find_ids(emails)
  end

  def self.split_emails(student_emails)
    student_emails.split(", ")
  end

  def self.find_ids(student_emails)
    User.where(:email => student_emails).pluck(:id)
  end
end
