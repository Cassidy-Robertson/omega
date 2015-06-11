class Course < ActiveRecord::Base
  belongs_to :teacher, class_name: "User"
  has_many :enrollments
  has_many :students, through: :enrollments

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :tags, :skills, :interests

  validates_format_of :zipcode,
     :with => /(^\d{5}(-\d{4})?$)|(^[ABCEGHJKLMNPRSTVXY]{1}\d{1}[A-Z]{1} *\d{1}[A-Z]{1}\d{1}$)/

end
