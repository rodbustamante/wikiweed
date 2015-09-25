class CreateImagePlants < ActiveRecord::Migration
  def change
    create_table :image_plants do |t|
      t.string :image
      t.references :plant, index: true

      t.timestamps
    end
  end
end
