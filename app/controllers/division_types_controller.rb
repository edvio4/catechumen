class DivisionTypesController < ApplicationController
  before_action :authenticate_user!

  def new
    @students = current_user.students
    @division_type = DivisionType.new
  end

  def create
    @students = current_user.students
    @division_type = DivisionType.new(division_type_params)
    if @division_type.update_attributes(user: current_user)
      flash.now[:notice] = "Unit Type added successfully"
      redirect_to new_resource_path
    else
      flash.now[:errors] = @division_type.errors.full_messages.join(". ")
      render :new
    end
  end

  private

  def division_type_params
    params.require(:division_type).permit(:name)
  end

end
