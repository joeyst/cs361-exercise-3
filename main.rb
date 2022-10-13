# Student -> Schedule -> Quarter -> CourseList

class Student

  attr_accessor :schedule
  MAX_COURSES = 5

  def initialize(schedule)
    @schedule = schedule
  end

  def remove_from_schedule(course, quarter_id)
    schedule.quarter[quarter_id].course_list.remove(course)
  end

  def add_to_schedule(course, quarter_id)
    quarter     = schedule.quarter[quarter_id]
    course_list = quarter.course_list
    max_courses = course_list.maximum_number_of_courses

    if max_courses < MAX_COURSES
        course_list.add(course)
    end
  end

end

class Schedule

  attr_accessor :quarters

  def initialize(quarters: [])
    @quarters = quarters
  end

  def get_quarter(quarter_id)
    quarters[quarter_id]
  end

end

class Quarter

  attr_accessor :course_list

  def initialize(course_list: CourseList.new)
    @course_list = course_list
  end

  def max_courses
    course_list.maximum_number_of_courses
  end

  def remove_course(course)
    course_list.remove_course(course)
  end

  def add_course(course)
    course_list.add_course(course)
  end

end

class CourseList

  attr_accessor :courses, :maximum_number_of_courses

  def initialize(courses: [], maximum_number_of_courses: MAX_COURSES)
    @courses = courses
    @maximum_number_of_courses = maximum_number_of_courses
  end

  def remove_course(course)
    courses.delete(course)
  end

  def add_course(course)
    courses << course
  end

end
