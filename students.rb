#!/usr/bin/env ruby
class Student
  attr_reader :name
  def initialize(name, grade)
    @name = name
    @grade = grade
  end


  def better_grade?(student)
    grade > student.grade
  end

  protected
  def grade
    @grade
  end
end


joe = Student.new("Joe", "D")
bob = Student.new("Bob", "A")

print "Well done" if joe.better_grade?(bob)

