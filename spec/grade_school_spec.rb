require "grade_school"

describe School do

  describe ".initialize" do

    it "empty grade" do
      school = School.new
      expected = []
      expect(school.students(1)).to eq(expected)
    end

  end

  describe ".add" do
    
    it "student" do
      school = School.new
      expect(school.add("Aimee", 2)).to(be_truthy)
      expected = ["Aimee"]
      expect(school.students(2)).to(eq(expected))
    end

    it "students to different grades" do
      school = School.new
      school.add("Aimee", 3)
      school.add("Beemee", 7)
      expect(school.students(3)).to(eq(["Aimee"]))
      expect(school.students(7)).to(eq(["Beemee"]))
    end

  end

  describe ".grade" do

    it "with multiple students" do
      school = School.new
      grade = 6
      students = ["Aimee", "Beemee", "Ceemee"]
      students.each { |student| school.add(student, grade) }
      expect(school.students(grade)).to(eq(students))
    end

    it "with multiple students sorts correctly" do
      school = School.new
      grade = 6
      students = ["Beemee", "Aimee", "Ceemee"]
      students.each { |student| school.add(student, grade) }
      expected = students.sort
      expect(school.students(grade)).to(eq(expected))
    end
    
  end

  context "sort" do
      
    it "empty students by grade" do
      school = School.new
      expected = []
      expect(school.students_by_grade).to(eq(expected))
    end

    it "students by grade" do
      school = School.new
      grade = 6
      students = ["Beemee", "Aimee", "Ceemee"]
      students.each { |student| school.add(student, grade) }
      expected = [{ :grade => grade, :students => students.sort }]
      expect(school.students_by_grade).to(eq(expected))
    end

    it "students by grade sorted" do
      school = School.new
      everyone.each do |grade|
        grade[:students].each { |student| school.add(student, grade[:grade]) }
      end
      expected = everyone_sorted
      expect(school.students_by_grade).to(eq(expected))
    end

  end

  def everyone
    [{ :grade => 3, :students => (["Deemee", "Eeemee"]) }, { :grade => 1, :students => (["Effmee", "Geemee"]) }, { :grade => 2, :students => (["Aimee", "Beemee", "Ceemee"]) }]
  end
  def everyone_sorted
    [{ :grade => 1, :students => (["Effmee", "Geemee"]) }, { :grade => 2, :students => (["Aimee", "Beemee", "Ceemee"]) }, { :grade => 3, :students => (["Deemee", "Eeemee"]) }]
  end
end
