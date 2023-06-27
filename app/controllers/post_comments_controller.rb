class PostCommentsController < ApplicationController
  def create
    exam = Exam.find(params[:exam_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.exam_id = exam.id
    comment.save
    redirect_to exam_path(exam)
  end

  def destroy
  end
  
   private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
  
end
