class CreateStrains < ActiveRecord::Migration
  def change
    create_table :strains do |t|
      t.string :name
      t.integer :sort_order
      t.string :slug

      t.timestamps
    end
  end
end
