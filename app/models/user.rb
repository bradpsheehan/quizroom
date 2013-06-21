class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :first_name, :last_name, :email, :teacher
  validates :email, :presence => true, :on => :create
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password
  validates :password, :presence => true, :confirmation => true, :on => :update_with_password
  validates :first_name, :presence => true, :on => :update_with_password
  validates :last_name,  :presence => true, :on => :update_with_password
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
      user.save
    end
    find_ids(emails)
  end

  def update_with_password(params)
    password = params.delete(:password)
    password_confirmation = params.delete(:password_confirmation)
    user = User.find_by_email(params[:email])
    user.update_attributes(params)
    user.password = password
    user.password_confirmation = password_confirmation
    user.save
    user
  end

  def self.split_emails(student_emails)
    student_emails.split(", ")
  end

  def self.find_ids(student_emails)
    User.where(:email => student_emails).pluck(:id)
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
