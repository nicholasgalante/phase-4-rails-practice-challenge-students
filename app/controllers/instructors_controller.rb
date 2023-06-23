class InstructorsController < ApplicationController
   def index
      instructors = Instructor.all 
      render json: instructors, status: :ok
   end

   def show
      instructor = Instructor.find(params[:id])
      render json: instructor, status: :ok
   end

   def update
      instructor = Instructor.find(params[:id])
      if instructor
         instructor.update(instructor_params)
      else 
         render json: { errror: "Instructor not found"}, status: :not_found
      end
   end

   def destroy
      instructor = Instructor.find(params[:id])
      if instructor
      instructor.destroy
      render json: {}
      else 
         render json: { errror: "Instructor not found"}, status: :not_found
      end
   end

   private

   def instructor_params
      params.permit(:name)
   end
end
