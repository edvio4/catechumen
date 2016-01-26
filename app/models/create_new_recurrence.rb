require_relative '../models/create_curriculum_form_options'

class CreateNewRecurrence

  def initialize(occurrence_ids, schedule)
    occurrence_ids.pop
    @occurrence_ids = []
    @occurrence_ids = occurrence_ids
    @schedule = schedule
    create_new_recurrence
  end

  def create_new_recurrence
    @occurrence_ids.each do |occurrence_id|
      Recurrence.create(schedule: @schedule, occurrence_id: occurrence_id)
    end
  end
end
