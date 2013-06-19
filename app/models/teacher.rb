class Teacher < User
  has_many :classrooms

  def self.create_with_password(params)
    user = new_with_password(params)
    user.type = "Teacher"
    user.save
    user
  end
end
