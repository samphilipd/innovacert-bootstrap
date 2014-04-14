class AddObservationSectionRefToObservationQuestions < ActiveRecord::Migration
  def change
    add_reference :observation_questions, :observation_section, index: true
  end
end
