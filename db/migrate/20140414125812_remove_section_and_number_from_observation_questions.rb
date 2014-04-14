class RemoveSectionAndNumberFromObservationQuestions < ActiveRecord::Migration
  def up
    remove_column :observation_questions, :section
    remove_column :observation_questions, :number
  end
  def down
    add_column :observation_questions, :section, :integer
    add_column :observation_questions, :number, :integer
  end
end
