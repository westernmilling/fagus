class CreateFagusCategories < ActiveRecord::Migration
  def change
    create_table :fagus_categories do |t|
      t.string :description, :null => false
      t.integer :is_active, :default => 1, :null => false
      t.string :name, :null => false
      t.string :reference, :null => false
      t.string :uuid, :limit => 32, :null => false

      t.datetime :deleted_at
      t.timestamps :null => false
    end
  end
end
