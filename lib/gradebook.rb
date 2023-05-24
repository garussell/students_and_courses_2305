class GradeBook
  attr_reader :instructor,
              :courses

  def initialize(instructor)
    @instructor = instructor
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def list_all_students(course)
    course.students.map do |student|
      student.name
    end
  end
end
