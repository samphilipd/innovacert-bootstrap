class RemoveInstrumentIdFromObservationQuestions < ActiveRecord::Migration
  def up
    remove_column :observation_questions, :instrument_id
  end
  def down
    add_reference :observation_questions, :instrument, index: true
  end
end
