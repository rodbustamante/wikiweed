class CreateSeedBanks < ActiveRecord::Migration
  def change
    create_table :seed_banks do |t|
      t.string :name
      t.text :summary
      t.string :image

      t.timestamps
    end
  end
end
