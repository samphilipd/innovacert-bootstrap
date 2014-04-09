class CreateUcls < ActiveRecord::Migration
  def change
    create_table :ucls do |t|
      t.string :code
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
