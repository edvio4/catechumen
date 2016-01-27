class StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :student, only: [:show, :edit, :update, :destroy]
  before_action :students, only: [:index, :new, :show]
  before_action :authorized_user?, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @student = Student.new
  end

  def show
  end

  def edit
  end

  def update
    if @student.update_attributes(student_params)
      flash[:notice] = "Student edited successfully"
      redirect_to student_path(@student)
    else
      flash[:errors] = @student.errors.full_messages.join(". ")
      render :edit
    end
  end

  def create
    @student = Student.new(student_params)
    if @student.update_attributes(user: current_user)
      flash[:notice] = "Student added successfully"
      redirect_to students_path
    else
      flash[:errors] = @student.errors.full_messages.join(". ")
      render :new
    end
  end

  def destroy
    @student.destroy
    flash[:success] = "Student Deleted"
    redirect_to root_path
  end

  private

  def student_params
    params.require(:student).permit(:name)
  end

  def student
    @student ||= Student.find(params[:id])
  end

  def students
    @students ||= current_user.students
  end
end
