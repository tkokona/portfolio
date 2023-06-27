class CreateExams < ActiveRecord::Migration[5.2]
  def change
    create_table :exams do |t|
      t.text :class_name
      t.text :caption
      t.integer :user_id

      t.timestamps
    end
  end
end
