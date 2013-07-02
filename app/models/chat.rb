class Chat < ActiveRecord::Base

  has_many :users
  belongs_to :quiz

  attr_accessible :classroom_id, :classroom_name, :quiz_id

  before_save :generate_public_channel, :generate_teacher_channel

  private

  def generate_public_channel
    self.public_channel ||= "public-#{Digest::SHA1.hexdigest(classroom_id.to_s)}"
  end

  def generate_teacher_channel
    self.teacher_channel ||= "teacher-#{Digest::SHA1.hexdigest(classroom_id.to_s)}"
  end
end
