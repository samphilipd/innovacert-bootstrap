class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :name
      t.integer :rut
      t.string :email_address

      t.timestamps
    end
  end
end
