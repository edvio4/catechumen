require_relative '../models/get_student_lessons'


class LessonsController < ApplicationController
  before_action :authenticate_user!

  def index
    @student  = Student.find(params[:student_id])
    authorized_user?
    @students = current_user.students
    date = params[:start_date]
    @lessons = GetStudentLessons.new(@student.curriculums, date).lessons
  end
end
