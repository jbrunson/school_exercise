require 'test_helper'

class EnrollmentTest < ActiveSupport::TestCase
  test "can't create a second enrollment for the same period" do
    c = Course.create(period: 1)
    d = Course.create(period: 1)
    s = Student.create

    s.enrollments.create(course: c)
    s.reload
    e = s.enrollments.new(course: d)
    assert_equal e.validate, false
  end

  test "can validate a course" do
    Course.delete_all
    Student.delete_all
    d = Course.create(period: 1)
    s = Student.create

    e = s.enrollments.new(course: d)
    assert_equal 1, Student.all.count
    assert_equal true, e.validate
  end
end
