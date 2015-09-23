class CreatePlantCategories < ActiveRecord::Migration
  def change
    create_table :plant_categories do |t|
      t.references :plant, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
