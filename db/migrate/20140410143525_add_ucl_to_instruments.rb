class AddUclToInstruments < ActiveRecord::Migration
  def change
    change_table :instruments do |t|
      t.belongs_to :ucl
    end
  end
end
