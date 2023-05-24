require 'rspec'
require './lib/student'

RSpec.describe Student do
  before(:each) do
    @student = Student.new({name: "Morgan", age: 21}) 
  end

  describe "#exists" do
    it "exists and has attributes" do
      expect(@student).to be_an_instance_of(Student)
      expect(@student.name).to eq("Morgan")
      expect(@student.age).to eq(21)
      expect(@student.scores).to eq []
    end
  end
end