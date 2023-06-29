class AddFileIdToExams < ActiveRecord::Migration[5.2]
  def change
    add_column :exams, :file_id, :string
  end
end
