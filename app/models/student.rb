class Student < ActiveRecord::Base
  has_many :enrollments
  has_many :courses, through: :enrollments

  def self.by_letter(letter)
    where("name LIKE ?", "#{letter}%").order(:name)
  end
end
