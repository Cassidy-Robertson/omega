class Enrollment < ActiveRecord::Base
  belongs_to :student, class_name: 'User'
  belongs_to :course
  validates_uniqueness_of :student, scope: [:course]
end
