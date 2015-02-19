class StudentsController < ApplicationController

  def index
    if params[:letter]
      @students = Student.by_letter(params[:letter])
    else
      @students = Student.all
    end
  end

  def new
    @student = Student.new
  end

  def show
    @student = Student.find(params[:id])
    @students = Student.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @student = Student.create(student_params)

    if @student.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name)
  end
end