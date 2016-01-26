require_relative '../models/create_new_recurrence'
require_relative '../models/make_schedule_for_curriculum'

class SchedulesController < ApplicationController
  def new
    @students = Student.all
    @curriculum = Curriculum.find(params[:curriculum_id])
    @student  = @curriculum.student
    @schedule = Schedule.new
  end

  def create
    @students = Student.all
    @curriculum = Curriculum.find(params[:curriculum_id])
    @student  = @curriculum.student
    @schedule = Schedule.new(start_date: schedule_params[:start_date], pace_id: schedule_params[:pace_id], curriculum: @curriculum)
    if @schedule.save
      @curriculum.update_attributes(schedule: @schedule)
      CreateNewRecurrence.new(recurrence_params[:occurrence_id], @schedule)
      MakeScheduleForCurriculum.new(@curriculum)
      flash[:notice] = "Schedule added successfully"
      redirect_to curriculum_path(@curriculum)
    else
      flash[:errors] = @schedule.errors.full_messages.join(". ")
      render :new
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:start_date, :pace_id)
  end

  def recurrence_params
    params.require(:recurrence).permit(occurrence_id: [])
  end
end
