class AddNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :address1, :string
    add_column :users, :address2, :string
    add_column :users, :phone, :string
    add_column :users, :year, :int
    add_column :users, :month, :int
    add_column :users, :date, :int
    add_column :users, :sex, :int
  end
end
