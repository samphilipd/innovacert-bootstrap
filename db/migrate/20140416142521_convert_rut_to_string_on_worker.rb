class ConvertRutToStringOnWorker < ActiveRecord::Migration
  def up
    remove_column :workers, :rut
    add_column :workers, :rut, :string
  end
  def down
    raise ActiveRecord::IrreversibleMigration
    # because RUT should NEVER have been saved as an integer field,
    # because occasionally final char == "k"
  end
end
