class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :name
      t.text :summary
      t.text :characteristics
      t.integer :percent_sativa
      t.integer :percent_indica
      t.integer :thc
      t.integer :visits
      t.string :image
      t.string :video

      t.timestamps
    end
    add_index :plants, :name
  end
end
