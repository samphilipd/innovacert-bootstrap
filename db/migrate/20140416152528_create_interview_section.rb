class CreateInterviewSection < ActiveRecord::Migration
  def change
    create_table :interview_sections do |t|
      t.references :instrument, index: true
      t.integer :section_number
      t.string :name

      t.timestamps
    end
  end
end
