class CreateInterviewQuestion < ActiveRecord::Migration
  def change
    create_table :interview_questions do |t|
      t.references :interview_section, index: true
      t.integer :question_number
      t.text :question_content
      t.text :sample_answer

      t.timestamps
    end
  end
end
