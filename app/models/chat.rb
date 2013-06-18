class Chat < ActiveRecord::Base

  has_many :users
  belongs_to :classroom

  attr_accessible :public_channel, :teacher_channel

end
