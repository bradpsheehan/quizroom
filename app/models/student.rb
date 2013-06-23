class Student < User

  has_and_belongs_to_many :classrooms

  def self.find_or_create_students(student_emails)
    emails = split_emails(student_emails)
    new_students = emails - self.pluck(:email)
    new_students.each do |email|
      user = Student.new(email: email)
      user.password = email.split("@")[0]
      user.password_confirmation = user.password
      user.save
    end
    find_ids(emails)
  end
end
