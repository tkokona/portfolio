class Exam < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  attachment :file
  validates :class_name, presence: true
  validates :file, presence: true
  def self.looks(search, word)
    if search == "perfect_match"
      @exam = Exam.where("class_name LIKE ?","#{word}")
    elsif search == "partial_match"
      @exam = Exam.where("class_name LIKE ?","%#{word}%")
    else
      logger.debug @exam.to_sql
      @exam = Exam.all
    end
  end
end
