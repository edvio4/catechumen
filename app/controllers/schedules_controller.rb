class SchedulesController < ApplicationController
  def new
    @students = Student.all
    @curriculum = Curriculum.find(params[:curriculum_id])
    @student  = @curriculum.student
    @schedule = Schedule.new
  end

  def create
    binding.pry
    # @students = Student.all
    # @curriculum = Curriculum.find(params[:curriculum_id])
    # @resource = Resource.new(resource_params)
    # if @resource.save
    #   flash[:notice] = "Resource added successfully"
    #   redirect_to resources_path
    # else
    #   flash[:errors] = @resource.errors.full_messages.join(". ")
    #   render :new
    # end
  end

  private

  def curriculum_params
    params.require(:schedule).permit(:start_date, :pace_id)
  end

  def recurrence_params
    params.require(:recurrence).permit(:day_id)
  end
end
