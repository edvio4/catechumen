class StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :student, only: [:show, :edit, :update, :destroy]
  before_action :students, only: [:index, :new, :create, :show]
  before_action :authorized_user?, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json, :js

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
      flash.now[:notice] = "Student edited successfully"
      redirect_to student_path(@student)
    else
      flash.now[:errors] = @student.errors.full_messages.join(". ")
      render :edit
    end
  end

  def create
    @student = Student.new(student_params)
    respond_to do |format|
      if @student.update_attributes(user: current_user)
        format.html { redirect_to students_path, notice: "Student added successfully" }
        format.js {}
        format.json { render json: @student, status: :created}
      else
        format.html { render :new }
        format.js {}
        format.json { render json: @student, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @student.destroy
    flash.now[:success] = "Student Deleted"
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
