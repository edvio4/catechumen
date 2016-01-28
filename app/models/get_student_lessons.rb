require_relative 'calendar_lesson'

class GetStudentLessons
  attr_reader :lessons

  def initialize(curriculums, date)
    @curriculums = curriculums
    @date = Date.parse(date)
    @lessons = []
    @recurrence = []
    @scheduled_date = ""
    get_lessons
  end

  def get_lessons
    @curriculums.each do |curriculum|
      unless curriculum.schedule.nil?
        if pace_fraction?(curriculum.schedule.pace.pace)
          lessons_with_fraction(curriculum)
        else
          lessons_no_fraction(curriculum)
        end
      end
    end
  end

  def pace_fraction?(pace)
    pace =~ /[\/]/
  end

  def lessons_no_fraction(curriculum)
    curriculum_lessons = get_lessons_for_three_months(curriculum)
    curriculum_lessons.each do |lesson|
      @lessons << CalendarLesson.new(lesson)
    end
  end

  def lessons_with_fraction(curriculum)
    curriculum_lessons = get_lessons_for_three_months(curriculum)
    curriculum_lessons.each do |lesson|
      @scheduled_date = Date.parse(lesson.scheduled_date)
      @recurrence = get_recurrence(curriculum)
      lesson.duration.times do |index|
        if index == 0
          @lessons << CalendarLesson.new(lesson)
        else
          get_date
          @lessons << CalendarLesson.new(lesson, @scheduled_date.strftime('%F'))
        end
      end
    end
  end

  def get_lessons_for_three_months(curriculum)
    curriculum.lessons.select { |lesson| Date.parse(lesson.scheduled_date).month == @date.month || Date.parse(lesson.scheduled_date).month == (@date<<1).month || Date.parse(lesson.scheduled_date).month == (@date>>1).month }
  end

  def get_recurrence(curriculum)
    recurrence_array = []
    recurrence_objects = curriculum.schedule.recurrences
    recurrence_objects.each do |recurrence_object|
      recurrence_array << recurrence_object.occurrence_id
    end
    recurrence_array
  end

  def get_date
    @scheduled_date+=1
    while true
      break if date_match_recurrence?
      @scheduled_date+=1
    end
  end

  def date_match_recurrence?
    @recurrence.any? { |occurrence_id| occurrence_id.to_i == @scheduled_date.cwday }
  end
end
