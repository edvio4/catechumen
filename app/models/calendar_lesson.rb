class CalendarLesson
  attr_reader :start_time, :lesson_database_object

  def initialize(lesson, date="")
    @lesson_database_object = lesson
    @start_time = date.empty? ? lesson.scheduled_date : date
  end
end
