class CreateUcls < ActiveRecord::Migration
  def change
    create_table :ucls do |t|

      t.timestamps
    end
  end
end
