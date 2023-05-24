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
    @calculus = Course.new("Calculus", 2) 
    @history = Course.new("History", 3)
    @band = Course.new("Band", 4)
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

  describe "#add_course" do
    it "can add courses to the grade book" do
      @grade_book_1.add_course(@calculus)
      @grade_book_1.add_course(@history)
      @grade_book_2.add_course(@band)

      expect(@grade_book_1.courses).to eq([@calculus, @history])
      expect(@grade_book_2.courses).to eq([@band])
    end
  end

  describe "#list_all_students(course)" do
    it "can list all of the students in the courses" do
      # add courses
      @grade_book_1.add_course(@calculus)
      @grade_book_1.add_course(@history)
      @grade_book_2.add_course(@band)
      # enroll morgan
      @calculus.enroll(@morgan)
      @history.enroll(@morgan)
      # enroll jordan
      @calculus.enroll(@jordan)
      @history.enroll(@jordan)
      # enroll franky
      @band.enroll(@franky)

      expect(@grade_book_1.list_all_students(@calculus)).to eq(["Morgan", "Jordan"])
      expect(@grade_book_1.list_all_students(@history)).to eq(["Morgan", "Jordan"])
      expect(@grade_book_2.list_all_students(@band)).to eq(["Franky"])
    end

    describe "#students_below(threshold)" do
      it "can return a list of students whose grades are below a given threshold" do
        @grade_book_1.add_course(@calculus)
        @grade_book_1.add_course(@history)

        @calculus.enroll(@morgan)
        @calculus.enroll(@jordan)

        @morgan.log_score(89)
        @jordan.log_score(78)
        @jordan.log_score(45)

        expect(@grade_book_1.students_below(65)).to eq([@jordan])
        expect(@grade_book_1.students_below(90)).to eq([@morgan, @jordan])
      end
    end
  end
end