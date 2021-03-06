require_relative '../models/create_curriculum_form_options'

class CurriculumsController < ApplicationController
  before_action :authenticate_user!
  before_action :student, only: [:index, :create]
  before_action :curriculum, only: [:show, :edit, :update, :destroy]
  before_action :students, only: [:index, :show, :edit, :update, :create, :destroy]
  before_action :authorized_user?, only: [:index, :show, :edit, :update, :destroy]

  def index
    @curriculum = Curriculum.new
    get_grouped_options
  end


  def show
    @student  = @curriculum.student
    @lessons = order_lessons(@curriculum)
  end

  def edit
  end

  def update
    if @curriculum.update_attributes(curriculum_params)
      flash.now[:notice] = "Curriculum edited successfully"
      redirect_to curriculum_path(@curriculum)
    else
      flash.now[:errors] = @curriculum.errors.full_messages.join(". ")
      render :edit
    end
  end

  def create
    @curriculum = Curriculum.new(curriculum_params)
    if @curriculum.update_attributes(student: @student, user: current_user)
      CreateCurriculumLessons.new(@curriculum, current_user)
      flash[:notice] = "Curriculum added successfully"
      redirect_to student_curriculums_path(@student)
    else
      get_grouped_options
      flash.now[:errors] = @curriculum.errors.full_messages.join(". ")
      render :index
    end
  end

  def destroy
    @curriculum.destroy
    flash.now[:success] = "Curriculum Deleted"
    redirect_to root_path
  end

  private

  def curriculum_params
    params.require(:curriculum).permit(:resource_id)
  end

  def student
    @student ||= Student.find(params[:student_id])
  end

  def students
    @students ||= current_user.students
  end

  def curriculum
    @curriculum ||= Curriculum.find(params[:id])
  end

  def order_lessons(curriculum)
    resource = curriculum.resource
    lessons = curriculum.lessons
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

  def is_number?(string)
    string =~ /\d+/
  end

  def get_grouped_options
    resources = current_user.resources - @student.resources
    @grouped_options = CreateCurriculumFormOptions.new(resources).create_grouped_options
    @curriculums_by_subject = @student.subjects.order(:name).uniq
  end
end
