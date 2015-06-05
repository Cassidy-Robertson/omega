class Enrollment < ActiveRecord::Base
  belongs_to :student, class_name: 'User'
  belongs_to :course
  validates_uniqueness_of :student, scope: :course
  validate :user_not_teacher

  private

  def user_not_teacher
    return unless student == course.teacher
    errors.add(:teacher, "cannot be student")
  end
end
