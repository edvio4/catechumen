require_relative '../models/create_curriculum_form_options'

class CreateNewRecurrence

  def initialize(day_ids, schedule)
    day_ids.pop
    @day_ids = []
    @day_ids = day_ids
    @schedule = schedule
    create_new_recurrence
  end

  def create_new_recurrence
    @day_ids.each do |day_id|
      Recurrence.create(schedule: @schedule, day_id: day_id)
    end
  end
end
