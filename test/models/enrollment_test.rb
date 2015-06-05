require 'test_helper'

class EnrollmentTest < ActiveSupport::TestCase

  test "user cannot take the class they are teaching" do
    tim = User.create!(email: "tmurray002@gmail.com", password: "12345678")
    swag202 = Course.create!(topic: "master the art of swag", teacher: tim)
    
    assert_raise ActiveRecord::RecordInvalid do
      swag202.students << tim
    end

  end

  test "user cannot take the same class twice" do
    tim = User.create!(email: "tmurray002@gmail.com", password: "12345678")
    kenny = User.create!(email: "kenny@gmail.com", password: "12345678")
    steven = User.create!(email: "steven@example.com", password: "12345678")
    swag202 = Course.create!(topic: "master the art of swag")
    swag202.teacher = tim
    swag202.save

    swag202.students << kenny
    swag202.students << steven
    assert_raise ActiveRecord::RecordInvalid do
      swag202.students << steven
    end
  end

  test "user can register for 2 clases" do
    kenny = User.create!(email: "kenny@gmail.com", password: "12345678")
    reading101 = Course.create!(topic: "learn to read code really good")
    swag202 = Course.create!(topic: "master the art of swag")

    swag202.students    << kenny
    reading101.students << kenny

    assert_equal 2, kenny.courses_taken.size

  end


end
