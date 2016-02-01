class ResourcesController < ApplicationController
  before_action :authenticate_user!
  before_action :resource, only: [:show, :edit, :update, :destroy]
  before_action :authorized_user?, only: [:show, :edit, :update, :destroy]

  def index
    @students = current_user.students
    @resources_by_subject = Subject.where(user: current_user).joins(:resources).group('subjects.id').order(:name)
  end

  def new
    @students = current_user.students
    @resource = Resource.new
    @subject = Subject.new
  end

  def show
    @students = current_user.students
  end

  def edit
  end

  def update
    if @resource.update_attributes(resource_params)
      flash[:notice] = "Resource edited successfully"
      redirect_to resource_path(@resource)
    else
      flash.now[:errors] = @resource.errors.full_messages.join(". ")
      render :edit
    end
  end

  def create
    @students = current_user.students
    @resource = Resource.new(resource_params)
    if @resource.update_attributes(user: current_user)
      flash.now[:notice] = "Resource added successfully"
      redirect_to resources_path
    else
      flash.now[:errors] = @resource.errors.full_messages.join(". ")
      render :new
    end
  end

  def destroy
    @resource.destroy
    flash.now[:success] = "Resource Deleted"
    redirect_to students_path
  end

  private

  def resource_params
    params.require(:resource).permit(:title, :units, :division_units, :unit_type_id, :division_type_id, :subject_id)
  end

  def resource
    @resource ||= Resource.find(params[:id])
  end
end
