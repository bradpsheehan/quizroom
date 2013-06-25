class Quiz < ActiveRecord::Base

  belongs_to :teacher
  has_many :questions

  accepts_nested_attributes_for :questions

  attr_accessible :name

end
