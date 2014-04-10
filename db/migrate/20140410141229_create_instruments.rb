class CreateInstruments < ActiveRecord::Migration
  def change
    create_table :instruments do |t|
      t.string :name
      t.belongs_to :ucls

      t.timestamps
    end
  end
end
