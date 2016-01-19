class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :body
      t.integer :score
      t.references :plant, index: true
      t.references :user, index: true
    end
  end
end
