class StudentsController < ApplicationController
   def index
      students = Student.all 
      render json: students, status: :ok
   end

   def show
      student = Student.find(params[:id])
      render json: student, status: :ok
   end

   def update
      student = Student.find(params[:id])
      if student
         student.update(student_params)
      else 
         render json: { errror: "Student not found"}, status: :not_found
      end
   end

   def destroy
      student = Student.find(params[:id])
      if student
      student.destroy
      render json: {}
      else 
         render json: { errror: "Student not found"}, status: :not_found
      end
   end

   private

   def student_params
      params.permit(:name, :major, :age)
   end
end
