require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  #  test "user can have many courses" do

   test "user can take many courses" do
    tim = User.create!(email: "tmurray002@gmail.com", password: "12345678")
    kenny = User.create!(email: "kenny@gmail.com", password: "12345678")
    steven = User.create!(email: "steven@example.com", password: "12345678")
    swag202 = Course.create!(topic: "master the art of swag")
    swag202.teacher = tim
    swag202.save

    swag202.students << kenny
    swag202.students << steven

    assert_equal steven.courses_taken.size, 1
    assert_equal steven.courses_taken.first.topic, 'master the art of swag'

  end


end
