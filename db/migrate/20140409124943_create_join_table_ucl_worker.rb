class CreateJoinTableUclWorker < ActiveRecord::Migration
  def change
    create_join_table :ucls, :workers do |t|
      t.index :ucl_id
      t.index :worker_id
    end
  end
end
