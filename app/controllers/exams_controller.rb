class ExamsController < ApplicationController
  
  def new
    @exam = Exam.new
  end
  
  def create
    @exam = Exam.new(exam_params)
    @exam.user_id = current_user.id
    if @exam.save
      redirect_to exams_path
    else
      render :new
    end
  end
  
  def index
    @user = current_user
    @exam = Exam.new
    @exams = Exam.all
  end
  
  def show
    @exam = Exam.find(params[:id])
    @user = @exam.user
    @post_comment = PostComment.new
  end
  
  def edit
    @exam = Exam.find(params[:id])
    unless @exam.user == current_user
      redirect_to exams_path
    end
  end
  
  def update
    @exam = Exam.find(params[:id])
    @exam.update(exam_params)
    if @exam.save
      flash[:notice] = 'You have updated exam successfully.'
      redirect_to exam_path(@exam.id)
    else
      render :edit
    end
  end
  
  def destroy
    exam = Exam.find(params[:id])
    exam.destroy
    redirect_to exams_path
  end
  
   private

  def exam_params
    params.require(:exam).permit(:class_name, :caption)
  end
  
end
