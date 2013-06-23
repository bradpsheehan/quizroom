module ObjectCreationMethods
  def create_teacher(first_name: "Teach", last_name: "Name", email: "teacher@example.com", password: "1234")
    u = Teacher.create! do |u|
        u.first_name = first_name
        u.last_name = last_name
        u.email = email
        u.password = password
        u.password_confirmation = password
    end
  end

  def create_student(first_name: "Student", last_name: "Name", email: "student@example.com", password: "1234")
    u = Student.create! do |u|
        u.first_name = first_name
        u.last_name = last_name
        u.email = email
        u.password = password
        u.password_confirmation = password
    end
  end
end