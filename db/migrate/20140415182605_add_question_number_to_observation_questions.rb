class AddQuestionNumberToObservationQuestions < ActiveRecord::Migration
  def change
    add_column :observation_questions, :question_number, :integer
  end
end
