class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :status
      t.integer :amount
      t.string :address1
      t.string :address2
      t.string :phone
      t.string :zipcode
      t.string :sender
      t.string :receiver
      t.timestamps
    end
  end
end
