class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.text :description, null: false
      t.integer :category_id, default: 0, null: false
      t.integer :condition_id, default: 0, null: false
      t.integer :delivery_charge_id, default: 0, null: false
      t.integer :prefecture_id, default: 0, null: false
      t.integer :delivery_time_id, default: 0, null: false
      t.integer :selling_price, null: false
      t.references :user, null: false
      t.timestamps
    end
  end
end
