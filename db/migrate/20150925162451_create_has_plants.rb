class CreateHasPlants < ActiveRecord::Migration
  def change
    create_table :has_plants do |t|
      t.references :plant, index: true
      t.references :growshop, index: true

      t.timestamps
    end
  end
end
