class CreateEvaluationEvents < ActiveRecord::Migration
  def change
    create_table :evaluation_events do |t|
      t.references :instrument, index: true
      t.references :worker, index: true
      t.datetime :evaluation_date

      t.timestamps
    end
  end
end
