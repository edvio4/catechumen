require 'date'

class MakeScheduleForCurriculum

  def initialize(curriculum)
    @curriculum = curriculum
    @scheduled_date = Date.parse(curriculum.schedule.start_date)
    @pace = curriculum.schedule.pace.pace
    @recurrence = get_recurrence
    make_schedule
  end

  def get_recurrence
    recurrence_array = []
    recurrence_objects = @curriculum.schedule.recurrences
    recurrence_objects.each do |recurrence_object|
      recurrence_array << recurrence_object.day_id
    end
    recurrence_array
  end

  def make_schedule
    lessons = order_lessons
    i=0
    while i < lessons.length
      unless lesson_completed?(lessons[i])
        if pace_fraction?
          j = 0
          while j < pace_fraction_number
            if scheduled_date_match_recurrence? && j == 0
              lessons[i].update_attributes(scheduled_date: @scheduled_date, duration: pace_fraction_number)
              j+=1
              @scheduled_date+=1
            elsif scheduled_date_match_recurrence?
              j+=1
              @scheduled_date+=1
            else
              @scheduled_date+=1
            end
          end
          i+=1
        else
          if scheduled_date_match_recurrence?
            j=0
            while j < @pace.to_i
              lessons[i].update_attributes(scheduled_date: @scheduled_date)
              j+=1
              i+=1
            end
          end
          @scheduled_date+=1
        end
      end
    end
  end

  def order_lessons
    resource = @curriculum.resource
    lessons = @curriculum.lessons
    if resource.division_units.empty?
      if is_number?(resource.units)
        return lessons.order('unit::int')
      else
        return lessons.order(:unit)
      end
    else
      if is_number?(resource.units) && is_number?(resource.division_units)
        return lessons.order('unit::int, division_unit::int')
      elsif is_number?(resource.units) && !is_number?(resource.division_units)
        return lessons.order('unit::int').order(:division_unit)
      elsif !is_number?(resource.units) && is_number?(resource.division_units)
        return lessons.order(:unit).order('division_unit::int')
      else
        return lessons.order(:unit, :division_unit)
      end
    end
  end

  def lesson_completed?(lesson)
    lesson.completed
  end

  def scheduled_date_match_recurrence?
    @recurrence.any? { |day_id| day_id.to_i == @scheduled_date.cwday }
  end

  def pace_fraction?
    @pace =~ /[\/]/
  end

  def pace_fraction_number
    @pace.reverse.chop.chop.reverse.to_i
  end

  def is_number?(string)
    string =~ /\d+/
  end
end
