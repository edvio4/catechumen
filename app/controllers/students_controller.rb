class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def show
    @students = Student.all
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

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
    if @student.save
      flash[:notice] = "Student added successfully"
      redirect_to students_path
    else
      flash[:errors] = @student.errors.full_messages.join(". ")
      render :new
    end
  end

  def destroy
    Student.find(params[:id]).destroy
    flash[:success] = "Student Deleted"
    redirect_to root_path
  end

  private

  def student_params
    params.require(:student).permit(:name)
  end
end
