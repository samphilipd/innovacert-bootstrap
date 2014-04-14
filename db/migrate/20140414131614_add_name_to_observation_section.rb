class AddNameToObservationSection < ActiveRecord::Migration
  def change
    add_column :observation_sections, :name, :string
  end
end
