class Course
  attr_reader :name,
              :capacity,
              :students

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @students = []
    @full = false
  end

  def full?
    return @full = true if @students.count >= @capacity
    @full
  end

  def enroll(student)
    @students << student
  end
end
