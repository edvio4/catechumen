require_relative '../models/get_student_lessons'


class LessonsController < ApplicationController
  def index
    @students = Student.all
    @student  = Student.find(params[:student_id])
    date = params[:start_date]
    @lessons = GetStudentLessons.new(@student.curriculums, date).lessons
  end

end
