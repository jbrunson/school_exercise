class OverlappingCourseValidator < ActiveModel::Validator
  def validate(enrollment)
    if overlapping_course?(enrollment)
      enrollment.errors[:base] << "Cannot enroll in this course as it clashes with another current enrollment"
    end
  end

  def overlapping_course?(enrollment)
    new_course = enrollment.course
    student = enrollment.student.reload

    student.courses.any? do |course| 
      course != new_course
      course.period == new_course.period
    end
  end
end
