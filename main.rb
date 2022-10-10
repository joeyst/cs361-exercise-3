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