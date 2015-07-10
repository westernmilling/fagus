class CreateFagusUnitOfMeasures < ActiveRecord::Migration
  def change
    create_table :fagus_unit_of_measures do |t|
      t.string :name, :null => false
      t.string :symbol, :limit => 32, :null => false
      t.string :unit_type, :limit => 16, :null => false
      t.string :uuid, :limit => 32, :null => false

      t.timestamps :null => false
    end
  end
end
