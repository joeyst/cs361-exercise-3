# Student -> Schedule -> Quarter -> CourseList

class Student
  private
  attr_accessor :schedule
  MAX_COURSES = 5

  public
  def initialize(schedule=Schedule.new)
    @schedule = schedule
  end

  def remove_from_schedule(course, quarter_id)
    schedule.remove_course(course, quarter_id)
  end

  def add_to_schedule(course, quarter_id, max_number=MAX_COURSES)
    schedule.add_course(course, quarter_id, max_number)
  end

  def get_schedule
    schedule.clone
  end

end

class Schedule
  private
  attr_accessor :quarters

  public
  def initialize(quarters: [])
    @quarters = quarters
  end

  def get_quarter(quarter_id)
    quarters[quarter_id]
  end

  def max_courses(quarter_id)
    quarters[quarter_id].max_courses
  end

  def remove_course(course, quarter_id)
    quarters[quarter_id].remove_course(course)
  end

  def add_course(course, quarter_id, max_number)
    quarters[quarter_id].add_course(course, max_number)
  end

end

class Quarter
  private
  attr_accessor :course_list

  public
  def initialize(course_list: CourseList.new)
    @course_list = course_list
  end

  def max_courses
    course_list.maximum_number_of_courses
  end

  def remove_course(course)
    course_list.remove_course(course)
  end

  def add_course(course, max_number)
    course_list.add_course(course, max_number)
  end

end

class CourseList
  private
  attr_accessor :courses, :maximum_number_of_courses
  MAX_NUMBER=5

  public
  def initialize(maximum_number_of_courses=MAX_NUMBER, courses: [])
    @courses = courses
    @maximum_number_of_courses = maximum_number_of_courses
  end

  def remove_course(course)
    courses.delete(course)
  end

  def add_course(course, max_number)
    if maximum_number_of_courses < max_number
      courses << course
    end
  end

end

sch = Schedule.new(quarters: Array.new(100, Quarter.new))
student = Student.new(sch)
student.add_to_schedule(Quarter.new, 5)
puts student.get_schedule