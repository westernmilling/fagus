class CreateFagusItemTypes < ActiveRecord::Migration
  def change
    create_table :fagus_item_types do |t|
      t.string :description, :null => false
      t.integer :is_active, :default => 0, :null => false
      t.string :uuid, :limit => 32, :null => false

      t.timestamps :null => false
    end
  end
end
