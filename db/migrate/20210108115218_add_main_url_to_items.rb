class AddMainUrlToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :name, :string
    add_column :items, :price, :int
    add_column :items, :content, :string
  end
end
