require 'rspec'
require './lib/course'
require './lib/student'
require './lib/gradebook'

RSpec.describe GradeBook do
  before(:each) do
    # gradebooks
    @grade_book_1 = GradeBook.new("Prof Smally")
    @grade_book_2 = GradeBook.new("Prof Nutty")
    # courses
    @course1 = Course.new("Calculus", 2) 
    @course2 = Course.new("History", 3)
    @course3 = Course.new("Band", 4)
    # students
    @morgan = Student.new({name: "Morgan", age: 21})
    @jordan = Student.new({name: "Jordan", age: 29}) 
    @franky = Student.new({name: "Franky", age: 37})
  end

  describe "#exists" do
    it "exists and has attributes" do
      expect(@grade_book_1).to be_an_instance_of(GradeBook)
      expect(@grade_book_1.instructor).to eq("Prof Smally")
      expect(@grade_book_2.courses).to eq []
    end
  end

  describe "#list_all_students" do
    it "can list all of the students in the courses" do
      # enroll morgan
      @course1.enroll(@morgan)
      @course2.enroll(@morgan)
      # enroll jordan
      @course1.enroll(@jordan)
      @course2.enroll(@jordan)
     # enroll franky
      @course3.enroll(@franky)

      expect(@grade_book_1.list_all_students).to eq({
        @course1 => [@morgan, @jordan],
        @course2 => [@morgan, @jordan],
        @course3 => [@franky]
      })
    end

  end
end