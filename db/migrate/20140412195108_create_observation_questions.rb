class CreateObservationQuestions < ActiveRecord::Migration
  def up
    create_table :observation_questions do |t|
      t.text :content
      t.integer :section
      t.integer :number

      t.timestamps
    end

    add_reference :observation_questions, :instrument, index: true
  end

  def down
    drop_table :observation_questions
  end
end
