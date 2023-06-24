class StudentsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    students = Student.all
    render json: students, status: :ok
  end

  def show
    student = find_student
    render json: student, status: :ok
  end

  def update
    student = find_student
    student.update(student_params)
  end

  def destroy
    student = find_student
    student.destroy
    render json: {}
  end

  private

  def student_params
    params.permit(:name, :major, :age)
  end

  def find_student
    Student.find(params[:id])
  end

  def render_not_found_response
    render json: { eror: "Student not found" }, status: :not_found
  end
end
