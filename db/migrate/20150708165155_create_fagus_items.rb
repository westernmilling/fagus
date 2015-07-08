class CreateFagusItems < ActiveRecord::Migration
  def change
    create_table :fagus_items do |t|
      t.references :category, :null => false
      t.string :description, :null => false
      t.references :item_type, :null => false
      t.string :reference, :null => false
      t.string :status, :limit => 16, :null => false
      t.string :uuid, :limit => 32, :null => false

      t.datetime :deleted_at
      t.timestamps :null => false
    end

    add_foreign_key :fagus_items, :fagus_categories, :column => :category_id
    add_foreign_key :fagus_items, :fagus_item_types, :column => :item_type_id
  end
end
