class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = Array.new
    @students = Array.new
    @grades = Hash.new { |hash, k| hash[k] = Array.new }
  end

  def name
    @name
  end

  def slogan
    @slogan
  end

  def teachers
    @teachers
  end

  def students
    @students
  end

  def hire(teacher)
    @teachers << teacher
  end

  def enroll(student)
    if @students.length < @student_capacity
      @students << student
      return true
    else
      return false
    end
  end

  def enrolled?(name)
    if @students.include?(name)
      return true
    else
      return false
    end
  end


  def student_to_teacher_ratio
    ratio = @students.length / @teachers.length
  end

  def add_grade(student, grade)
    if enrolled?(student)
      @grades[student] << grade
      return true
    else
      return false
    end
      
  end
   
  def num_grades(student)
    num_grades = @grades[student].length
  end

  def average_grade(student)
    if !enrolled?(student) || num_grades(student) == 0
      return nil
    else
      average = (@grades[student].sum)/num_grades(student)
    end
  end
end
