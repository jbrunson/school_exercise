class Enrollment < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with OverlappingCourseValidator
  validates_uniqueness_of :student_id, :scope => :course_id

  belongs_to :student
  belongs_to :course
end
