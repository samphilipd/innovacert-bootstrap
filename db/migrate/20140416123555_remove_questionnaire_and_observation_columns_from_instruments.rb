class RemoveQuestionnaireAndObservationColumnsFromInstruments < ActiveRecord::Migration
  def up
    remove_column :instruments, :questionnaire
    remove_column :instruments, :observation
  end
  def down
    add_column :instruments, :questionnaire, :text
    add_column :instruments, :observation, :text
  end
end
