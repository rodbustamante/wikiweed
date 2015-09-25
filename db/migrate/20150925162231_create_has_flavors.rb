class CreateHasFlavors < ActiveRecord::Migration
  def change
    create_table :has_flavors do |t|
      t.references :flavor, index: true
      t.references :plant, index: true

      t.timestamps
    end
  end
end
