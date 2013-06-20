class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :first_name, :last_name, :email, :teacher
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password

  before_save :generate_token


  def generate_token
    self.token ||= Digest::SHA1.hexdigest(id.to_s)
  end

  def self.new_with_password(user_attributes)
    password = user_attributes.delete(:password)
    password_confirmation = user_attributes.delete(:password_confirmation)
    user = User.new(user_attributes)
    user.password = password
    user.password_confirmation = password_confirmation
    user
  end

  def self.create_with_password(user_attributes)
    user = new_with_password(user_attributes)
    user.save
    user
  end

  def self.split_emails(student_emails)
    student_emails.split(", ")
  end

  def self.find_ids(student_emails)
    User.where(:email => student_emails).pluck(:id)
  end

  def teacher?
    type == "Teacher"
  end
end
