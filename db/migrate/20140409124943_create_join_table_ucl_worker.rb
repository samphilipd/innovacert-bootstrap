class CreateJoinTableUclWorker < ActiveRecord::Migration
  def change
    create_join_table :ucls, :workers, id: false do |t|
      t.integer :ucl_id
      t.integer :worker_id
    end
  end
end
