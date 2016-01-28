class SubjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :students, only: [:index, :new, :create]
  respond_to :html, :json, :js

  def index
    @students = current_user.students
    @subjects = current_user.subjects
    @subject = Subject.new
  end

  def new
    @students = current_user.students
    @subject = Subject.new
  end

  def create
    @students = current_user.students
    @subject = Subject.new(subject_params)
    respond_to do |format|
      if @subject.update_attributes(user: current_user)
        format.html { redirect_to subjects_path, notice: "Subject added successfully" }
        format.js {}
        format.json { render json: @subject, status: :created, location: @subject }
      else
        format.html { render :new }
        format.js {}
        format.json { render json: @subject, status: :unprocessable_entity }
      end
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
