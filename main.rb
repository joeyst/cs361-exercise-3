# Student -> Schedule -> Quarter -> CourseList

class Student

  attr_accessor :schedule
  MAX_COURSES = 5

  def initialize(schedule)
    @schedule = schedule
  end

  def quarter(quarter_id)
    schedule.quarter[quarter_id]
  end

  def drop_course(course, quarter_id)
    quarter(quarter_id).drop(course)
  end

  def drop_course_from_a_term(quarter, course)
    quarter
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

  def initialize(quarters)
    @quarters = quarters
  end

  def get_quarter(quarter_id)
    quarters[quarter_id]
  end

end