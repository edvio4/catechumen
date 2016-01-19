class ResourcesController < ApplicationController
  def index
    @students = Student.all
    @resources_by_subject = Subject.order(:name)
  end

  def new
    @students = Student.all
    @resource = Resource.new
  end

  def show
    @students = Student.all
    @resource = Resource.find(params[:id])
  end

  def edit
    @resource = Resource.find(params[:id])
  end

  def update
    @resource = Resource.find(params[:id])
    if @resource.update_attributes(resource_params)
      flash[:notice] = "Resource edited successfully"
      redirect_to resource_path(@resource)
    else
      flash[:errors] = @resource.errors.full_messages.join(". ")
      render :edit
    end
  end

  def create
    @students = Student.all
    @resource = Resource.new(resource_params)
    if @resource.save
      flash[:notice] = "Resource added successfully"
      redirect_to resources_path
    else
      flash[:errors] = @resource.errors.full_messages.join(". ")
      render :new
    end
  end

  def destroy
    Resource.find(params[:id]).destroy
    flash[:success] = "Resource Deleted"
    redirect_to root_path
  end

  private

  def resource_params
    params.require(:resource).permit(:title, :units, :division_units, :unit_type_id, :division_type_id, :subject_id)
  end
end
