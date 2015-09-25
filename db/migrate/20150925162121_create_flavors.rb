class CreateFlavors < ActiveRecord::Migration
  def change
    create_table :flavors do |t|
      t.string :name
      t.string :image
      t.string :image

      t.timestamps
    end
  end
end
