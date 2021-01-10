class AddImageToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :image, :string
    add_column :items, :quantity, :int
  end
end
