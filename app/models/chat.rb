class Chat < ActiveRecord::Base

  has_many :users

  attr_accessible :classroom_id, :classroom_name




end
