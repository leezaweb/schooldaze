class Course < ActiveRecord::Base
  belongs_to :teacher
  has_many :registrations
  has_many :students, through: :registrations


end
