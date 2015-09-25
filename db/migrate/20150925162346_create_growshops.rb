class CreateGrowshops < ActiveRecord::Migration
  def change
    create_table :growshops do |t|
      t.string :name
      t.string :image
      t.string :address
      t.string :phone
      t.string :cellphone
      t.string :email

      t.timestamps
    end
  end
end
