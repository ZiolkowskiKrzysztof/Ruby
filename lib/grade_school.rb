=begin
Write your code for the 'Grade School' exercise in this file. Make the tests in
`grade_school_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/grade-school` directory.
=end

class School
    
    def initialize
        @roster = Hash.new { |hash, key|  hash[key] = [] }
    end
  
    def add(student, grade)
        @roster[grade].push(student)
    end
  
    def students(grade)
        @roster[grade].sort
    end
  
    def students_by_grade
        return [] if @roster.empty?
        @roster.sort.map do |grade, students| { 
            :grade => grade, :students => students.sort 
        }
        end
    end
end

