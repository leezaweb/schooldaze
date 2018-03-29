class Student < ActiveRecord::Base
  has_many :registrations
  has_many :courses, through: :registrations
    has_many :teachers, through: :courses

    # def report_card
    #   grades = self.registrations.includes(:course)
    #   puts tp grades.distinct, "course.subject", :grade
    # end
end
