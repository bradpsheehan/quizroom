class Chat < ActiveRecord::Base

  has_many :users

  attr_accessible :classroom_id, :classroom_name


  def public_channel
    key = "classroom_name
    "public-#{Digest::SHA1.hexdigest key}"
  end

  def self.create_with_teacher_id(classroom_id, classroom_name, teacher_id)
  end

end
