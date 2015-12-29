class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :body
      t.integer :score, default: 0
      t.references :plant, index: true

      t.timestamps
    end
  end
end
