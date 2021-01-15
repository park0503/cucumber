class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.string :title
      t.string :image
      t.string :content
      t.integer :score
      t.timestamps
    end
  end
end
