class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :profile_picture, ProfilePictureUploader
  mount_uploader :profile_background, ProfileBackgroundUploader

  has_many :enrollments, foreign_key: "student_id"
  has_many :courses_taken, through: :enrollments, source: :course
  has_many :courses_taught, foreign_key: "teacher_id", class_name: Course

  
end
