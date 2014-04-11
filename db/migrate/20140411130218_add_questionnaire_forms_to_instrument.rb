class AddQuestionnaireFormsToInstrument < ActiveRecord::Migration
  def change
    change_table :instruments do |t|
      t.text :questionnaire
      t.text :observation
    end
  end
end
