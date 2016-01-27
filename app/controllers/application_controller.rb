class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?


  def authorized_user?
    if !user_student? || !user_curriculum? || !user_resource? || !user_subject? || !user_lesson? || !user_schedule?
      flash[:notice] = "The page you are looking for belongs to another user"
      redirect_to students_path
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name]
  end

  def user_student?
    return true if @student.nil?
    current_user == @student.user
  end

  def user_curriculum?
    return true if @curriculum.nil?
    current_user == @curriculum.user
  end

  def user_resource?
    return true if @resource.nil?
    current_user == @resource.user
  end

  def user_subject?
    return true if @subject.nil?
    current_user == @subject.user
  end

  def user_lesson?
    return true if @lesson.nil?
    current_user == @lesson.user
  end

  def user_schedule?
    return true if @schedule.nil?
    current_user == @schedule.user
  end
end
