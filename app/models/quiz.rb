class Quiz < ActiveRecord::Base

  attr_accessible :teacher_id, :name

  belongs_to :teacher
  has_many :questions, order: :position

  accepts_nested_attributes_for :questions

  attr_accessible :name

end
