class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.name :string
      t.price :int
      t.main_image :string
      t.content :string
      t.timestamps
    end
  end
end
