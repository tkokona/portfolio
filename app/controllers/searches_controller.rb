class SearchesController < ApplicationController
  def search
    @range = params[:range]
    @exams = Exam.looks(params[:search], params[:word])
    @user = current_user
  end
end