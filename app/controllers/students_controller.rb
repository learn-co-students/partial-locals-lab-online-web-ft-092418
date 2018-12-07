class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def show
    @student = Student.find(params[:id])
  end

  def index   
    if params[:student]
      @students = Student.search(params[:student])
      unless @students
        flash[:message] = "Student by name of #{params[:student]} not found."
        redirect_to students_path
      end
    else 
      @students = Student.all
    end
  end

  # def search
  #   binding.pry
  # end

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end
