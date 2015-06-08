class Course < ActiveRecord::Base
  belongs_to :teacher, class_name: "User"
  has_many :enrollments
  has_many :notifications
  has_many :students, through: :enrollments
end
