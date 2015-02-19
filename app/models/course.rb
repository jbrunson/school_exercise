class Course < ActiveRecord::Base
  has_many :enrollments
  has_many :students, through: :enrollments

  default_scope { order("period ASC") }

  def period_time  #super dodgy code but it got the job done in the short term!  haha
    case period
    when 1 
      "Period #{period} | 7:45a - 8:45a"
    when 2
      "Period #{period} | 8:55a - 9:55a"
    when 3
      "Period #{period} | 10:05a - 11:05a"
    when 4
      "Period #{period} | 11:15a - 12:15p"
    when 5
      "Period #{period} | 12:25p - 1:25p"
    when 6
      "Period #{period} | 1:35p - 2:35p"
    when 7
      "Period #{period} | 2:45p - 3:45p"
    when 8
      "Period #{period} | 3:55p - 4:55p"
    end
  end
end
