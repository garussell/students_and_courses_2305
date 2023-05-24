class Student
  attr_reader :name, 
              :age,
              :scores
 
  def initialize(info)
    @name = info[:name]
    @age = info[:age]
    @scores = []
  end

  def log_score(score)
    @scores << score
  end

  def grade
    sum = 0
    @scores.each do |score|
      sum += score
    end
    sum.to_f / @scores.count
  end
end
