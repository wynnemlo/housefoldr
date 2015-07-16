class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :model
      t.string :serial
      t.integer :category_id
      t.integer :user_id
      t.integer :price
      t.datetime :end_of_warranty
      t.string :purchase_location
      t.datetime :purchase_date
      t.string :method_of_payment
      t.text :notes

      t.timestamps
    end
  end
end
