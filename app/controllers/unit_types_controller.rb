class UnitTypesController < ApplicationController
  before_action :authenticate_user!

  def new
    @students = current_user.students
    @unit_type = UnitType.new
  end

  def create
    @students = current_user.students
    @unit_type = UnitType.new(unit_type_params)
    if @unit_type.update_attributes(user: current_user)
      flash.now[:notice] = "Unit Type added successfully"
      redirect_to new_resource_path
    else
      flash.now[:errors] = @unit_type.errors.full_messages.join(". ")
      render :new
    end
  end

  private

  def unit_type_params
    params.require(:unit_type).permit(:name)
  end

end
