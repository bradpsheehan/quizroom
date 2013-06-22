module ObjectCreationMethods
  def create_teacher(first_name, last_name, email, password)
    u = User.create! do |u|
        u.first_name = first_name
        u.last_name = last_name
        u.email = email
        u.password = password
        u.password_confirmation = password
        u.teacher = true
    end
  end

  def create_student(first_name, email)
    User.create(first_name: first_name, email: email)
  end
end