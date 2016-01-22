require_relative '../models/create_curriculum_form_options'

class CurriculumsController < ApplicationController
  def index
    @student = Student.find(params[:student_id])
    @students = Student.all
    @curriculum = Curriculum.new
    @resources = Resource.joins(:curriculums).where.not(curriculums: { student: @student } ).order(:title)

    @grouped_options = CreateCurriculumFormOptions.new(@student).create_grouped_options
    @curriculums_by_subject = @student.subjects.order(:name).uniq
  end


  def show
    @students = Student.all
    @curriculum = Curriculum.find(params[:id])
    @student  = @curriculum.student
  end

  def edit
    @curriculum = Curriculum.find(params[:id])
  end

  def update
    @curriculum = Curriculum.find(params[:id])
    if @curriculum.update_attributes(curriculum_params)
      flash[:notice] = "Curriculum edited successfully"
      redirect_to curriculum_path(@curriculum)
    else
      flash[:errors] = @curriculum.errors.full_messages.join(". ")
      render :edit
    end
  end

  def create
    @student = Student.find(params[:student_id])
    @curriculum = Curriculum.new(resource_id: curriculum_params[:resource_id], student: @student)
    if @curriculum.save
      CreateCurriculumLessons.new(@curriculum)
      flash[:notice] = "Curriculum added successfully"
      redirect_to student_curriculums_path(@student)
    else
      flash[:errors] = @curriculum.errors.full_messages.join(". ")
      redirect_to student_curriculums_path(@student)
    end
  end

  def destroy
    Curriculum.find(params[:id]).destroy
    flash[:success] = "Curriculum Deleted"
    redirect_to root_path
  end

  private

  def curriculum_params
    params.require(:curriculum).permit(:resource_id)
  end
end
