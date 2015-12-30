class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :text
      t.integer :score
      t.references :plant, index: true
    end
  end
end
