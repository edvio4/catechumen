class SubjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :students, only: [:index, :new, :create]

  def index
    @students = current_user.students
    @subjects = current_user.subjects
  end

  def new
    @students = current_user.students
    @subject = Subject.new
  end

  def create
    @students = current_user.students
    @subject = Subject.new(subject_params)
    if @subject.update_attributes(user: current_user)
      flash[:notice] = "Subject added successfully"
      redirect_to new_resource_path
    else
      flash[:errors] = @subject.errors.full_messages.join(". ")
      render :new
    end
  end

  private

  def subject_params
    params.require(:subject).permit(:name)
  end

  def students
    @students ||= current_user.students
  end
end
