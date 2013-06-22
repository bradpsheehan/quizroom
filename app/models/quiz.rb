class Quiz < ActiveRecord::BASE

  belongs_to_many :classroom
  has_many :questions

end
