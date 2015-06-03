require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test "user can be set as teacher for course" do
    tim = User.create!(email: "tmurray002@gmail.com", password: "12345678")
    swag202 = Course.create!(topic: "master the art of swag")
    swag202.teacher = tim
    swag202.save

    found_course = Course.find_by(topic: "master the art of swag")
    assert_equal found_course.teacher, tim
  end

  test "user can have many courses" do
    tim = User.create!(email: "tmurray002@gmail.com", password: "12345678")
    swag202 = Course.create!(topic: "master the art of swag")
    swag202.teacher = tim
    swag202.save

    assert_equal tim.courses.length, 1
  end
end

