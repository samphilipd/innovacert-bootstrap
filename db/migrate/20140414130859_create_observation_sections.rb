class CreateObservationSections < ActiveRecord::Migration
  def change
    create_table :observation_sections do |t|
      t.references :instrument, index: true
      t.integer :section_number

      t.timestamps
    end
  end
end
