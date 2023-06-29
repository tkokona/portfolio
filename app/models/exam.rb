class Exam < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  attachment :file
  validates :class_name, presence: true
  validates :file, presence: true
end
