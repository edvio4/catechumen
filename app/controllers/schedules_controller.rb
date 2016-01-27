require_relative '../models/create_new_recurrence'
require_relative '../models/make_schedule_for_curriculum'

class SchedulesController < ApplicationController
  before_action :authenticate_user!
  before_action :curriculum, only: [:new, :create]
  before_action :authorized_user?, only: [:new, :create]

  def new
    @students = current_user.students
    @student  = @curriculum.student
    @schedule = Schedule.new
  end

  def create
    @students = current_user.students
    @student  = @curriculum.student
    @schedule = Schedule.new(schedule_params)
    if @schedule.update_attributes(curriculum: @curriculum, user: current_user)
      @curriculum.update_attributes(schedule: @schedule)
      CreateNewRecurrence.new(recurrence_params[:occurrence_id], @schedule, current_user)
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

  def curriculum
    @curriculum ||= Curriculum.find(params[:curriculum_id])
  end
end
