class Chat < ActiveRecord::Base

  has_many :users

  attr_accessible :classroom_id, :classroom_name

  before_save :generate_public_channel

  private

  def generate_public_channel
    self.public_channel ||= "/blah"
  end
end
