class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :user
      t.string :name
      t.string :sku
      t.text :description
      t.text :short_description
      t.boolean :active
      t.decimal :weight, precision: 8, scale: 3, default: 0.0
      t.decimal :price,  precision: 8, scale: 2, default: 0.0
      t.decimal :cost_price, precision: 8, scale: 2, default: 0.0
      t.boolean :featured
      t.boolean :stock_control
      t.references :category

      t.timestamps null: false
    end
  end
end
